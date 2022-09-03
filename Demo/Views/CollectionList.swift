import DemoAPI
import Get
import SwiftUI

struct CollectionList {
    @State private var collections: [Collection] = []

    func load() async throws {
        let request = Paths.getAllCollections
        let response = try await APIClient.live.send(request)

        withAnimation {
            collections = response.value
        }
    }
}

extension CollectionList: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(collections) { collection in
                    NavigationLink {
                        RecipeList(collection: collection)
                    } label: {
                        CollectionCard(collection: collection)
                    }
                }
            }
            .padding(16)
        }
        .background(Color.primaryBackground)
        .navigationTitle("Collections")
        .throwingTask(supportsRetry: true) {
            try await load()
        }
    }
}
