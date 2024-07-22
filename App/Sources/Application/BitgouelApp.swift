import Service
import SwiftUI

@main
struct BitgouelApp: App {
    @StateObject private var sceneState = SceneState(sceneFlow: .main)
    @StateObject private var adminPageState = AdminPageState(adminPageFlow: .user)

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(sceneState)
                .environmentObject(adminPageState)
        }
    }
}
