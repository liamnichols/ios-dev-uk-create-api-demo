import SwiftUI

@main
struct DemoApp: App {
    init() {
        UIBarButtonItem.appearance().applyMise()
        UINavigationBar.appearance().applyMise()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                CollectionList()
            }
        }
    }
}
