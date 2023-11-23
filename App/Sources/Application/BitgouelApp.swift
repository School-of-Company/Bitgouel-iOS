import SwiftUI

@main
struct BitgouelApp: App {
    @StateObject var appState = AppState(sceneFlow: .login)
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
