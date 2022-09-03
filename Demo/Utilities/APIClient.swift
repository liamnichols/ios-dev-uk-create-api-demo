import Foundation
import Get

extension APIClient {
    static let live = APIClient(
        baseURL: URL(string: "https://cookpad.github.io/global-mobile-hiring")
    )
}
