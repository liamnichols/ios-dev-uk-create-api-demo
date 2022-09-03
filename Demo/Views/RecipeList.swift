import DemoAPI
import Get
import SwiftUI

struct RecipeList {
    let collection: Collection

    @State private var recipes: [Recipe] = []

    func load() async throws {
        let request = Paths.getCollectionRecipes(id: collection.id)
        let response = try await APIClient.live.send(request)

        withAnimation {
            recipes = response.value
        }
    }
}

extension RecipeList: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(recipes) { recipe in
                    RecipeCard(recipe: recipe)
                }
            }
            .padding(16)
        }
        .background(Color.primaryBackground)
        .navigationBarTitle("Recipes", displayMode: .inline)
        .throwingTask(supportsRetry: true) {
            try await load()
        }
    }
}
