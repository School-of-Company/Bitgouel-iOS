import Foundation
import Service
import SwiftUI

struct LoginDependency {
    let loginUseCase: any LoginUseCase
}

final class LoginFactory {
    let dependency: LoginDependency
    
    init(dependency: LoginDependency) {
        self.dependency = dependency
    }
    
    func makeView() -> some View {
        let viewModel = LoginViewModel(loginUseCase: dependency.loginUseCase)
        return LoginView(viewModel: viewModel)
    }
}
