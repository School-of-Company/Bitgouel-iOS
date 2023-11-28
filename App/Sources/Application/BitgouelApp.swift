import SwiftUI
import Service

@main
struct BitgouelApp: App {
    @StateObject var appState = SceneState(sceneFlow: .login)
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(appState)
        }
    }
}
