import SwiftUI
import Service

@main
struct BitgouelApp: App {
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
