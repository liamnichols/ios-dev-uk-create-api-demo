import Foundation
import NukeUI
import SwiftUI

struct LazyImage: View {
    let url: URL?

    var body: some View {
        NukeUI.LazyImage(url: url) { state in
            if let image = state.image {
                image
            } else {
                Color.placeholder
            }
        }
    }
}
