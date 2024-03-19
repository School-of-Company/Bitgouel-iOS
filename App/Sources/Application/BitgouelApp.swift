import Service
import SwiftUI

@main
struct BitgouelApp: App {
    @StateObject private var sceneState = SceneState(sceneFlow: .login)

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(sceneState)
        }
    }
}
