import DemoAPI
import SwiftUI

struct CollectionCard {
    var title: String
    var description: String
    var imageURL: URL?
}

extension CollectionCard {
    init(collection: Collection) {
        self.init(
            title: collection.title,
            description: collection.description,
            imageURL: collection.previewImageURLs.first
        )
    }
}

extension CollectionCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            LazyImage(url: imageURL)
                .frame(maxWidth: .infinity)
                .frame(height: 220)

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .lineLimit(2)
                    .foregroundColor(.primaryText)
                    .font(.mise(size: 24, weight: .semibold))

                Text(description)
                    .lineLimit(nil)
                    .foregroundColor(.secondaryText)
                    .font(.mise(size: 14, weight: .regular))
            }
            .padding()
            .multilineTextAlignment(.leading)
        }
        .cardStyle()
    }
}
