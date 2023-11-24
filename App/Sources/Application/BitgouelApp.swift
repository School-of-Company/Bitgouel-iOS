import SwiftUI
import Service

@main
struct BitgouelApp: App {
    @StateObject var appState = SceneState(sceneFlow: .login)
    private let keychain: any Keychain
    
    init() {
        registerProviderFactories()
        self.keychain = KeychainImpl()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(appState)
        }
    }
}
