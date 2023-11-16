import SwiftUI

@main
struct BitgouelApp: App {
    var body: some Scene {
        WindowGroup {
            StudentSignUpView(viewModel: StudentSignUpViewModel())
        }
    }
}
