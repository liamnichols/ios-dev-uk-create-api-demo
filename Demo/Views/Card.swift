import SwiftUI

struct Card<Content: View>: View {
    let content: () -> Content

    init(content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .frame(maxWidth: .infinity)
            .background(Color.secondaryBackground)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(color: .black.opacity(0.06), radius: 4.0, x: 0, y: 2)
    }
}

extension View {
    func cardStyle() -> some View {
        Card {
            self
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Card {
                Text("Hello")
                    .frame(height: 100)
            }

            Card {
                Text("Bye")
            }
        }
        .frame(maxHeight: .infinity)
        .padding()
        .background(Color.primaryBackground)
    }
}
