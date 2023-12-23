import Service
import SwiftUI

@main
struct BitgouelApp: App {
    @StateObject private var sceneState = SceneState(sceneFlow: .Activity)

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
