import SwiftUI
import Service

@main
struct BitgouelApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
