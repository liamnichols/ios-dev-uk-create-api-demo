// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get

extension Paths {
    /// All Collections
    ///
    /// Returns an array of all Collection models in display order.
    static public var getAllCollections: Request<[DemoAPI.Collection]> {
        Request(method: "GET", url: "/api/collections", id: "getAllCollections")
    }
}
