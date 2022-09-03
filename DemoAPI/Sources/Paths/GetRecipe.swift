// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get

extension Paths {
    /// Find a Recipe by ID
    ///
    /// Returns a specific Recipe model with the given identifier.
    static public func getRecipe(id: Int) -> Request<DemoAPI.Recipe> {
        Request(method: "GET", url: "/api/recipes/\(id)", id: "getRecipe")
    }
}
