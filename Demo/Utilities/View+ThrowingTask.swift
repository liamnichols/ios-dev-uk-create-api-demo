import SwiftUI

private struct ThrowingTaskView<Content: View>: View {
    struct ErrorDetails: Identifiable {
        let id = UUID()
        let error: Error
    }

    let content: () -> Content
    let action: () async throws -> Void
    let supportsRetry: Bool
    @State private var errorDetails: ErrorDetails?

    var body: some View {
        content()
            .task {
                await performAction()
            }
            .alert(item: $errorDetails) { details in
                if supportsRetry {
                    return Alert(
                        title: Text("Error"),
                        message: Text(details.error.localizedDescription),
                        primaryButton: .default(Text("Retry"), action: performRetry),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                } else {
                    return Alert(
                        title: Text("Error"),
                        message: Text(details.error.localizedDescription),
                        dismissButton: .cancel(Text("Dismiss"))
                    )
                }
            }
    }

    func performRetry() {
        Task {
            await performAction()
        }
    }

    func performAction() async {
        do {
            try await action()
        } catch {
            errorDetails = ErrorDetails(error: error)
        }
    }
}

extension View {
    func throwingTask(supportsRetry: Bool = false, action: @escaping @Sendable () async throws -> Void) -> some View {
        ThrowingTaskView(content: { self }, action: action, supportsRetry: supportsRetry)
    }
}
