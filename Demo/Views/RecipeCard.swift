import DemoAPI
import SwiftUI

struct RecipeCard {
    var title: String
    var description: String
    var userImageURL: URL?
    var userName: String
    var recipeImageURL: URL?
}

extension RecipeCard {
    init(recipe: Recipe) {
        self.init(
            title: recipe.title,
            description: recipe.story,
            userImageURL: recipe.user.imageURL,
            userName: recipe.user.name,
            recipeImageURL: recipe.imageURL
        )
    }
}

extension RecipeCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .foregroundColor(.primaryText)
                    .font(.mise(size: 16, weight: .semibold))
                    .lineLimit(2)

                HStack(alignment: .center, spacing: 8) {
                    LazyImage(url: userImageURL)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())

                    Text(userName)
                        .foregroundColor(.secondaryText)
                        .font(.mise(size: 12, weight: .regular))
                        .lineLimit(1)
                }

                Text(description)
                    .foregroundColor(.secondaryText)
                    .font(.mise(size: 14, weight: .regular))
                    .lineLimit(nil)
            }
            .multilineTextAlignment(.leading)

            Spacer()

            LazyImage(url: recipeImageURL)
                .frame(maxHeight: .infinity)
                .frame(width: 123)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 155)
        .cardStyle()
    }
}
