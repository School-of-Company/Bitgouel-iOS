import Foundation
import SwiftUI
import Service

public protocol LoginDependency {
    var loginUseCase: LoginUseCase { get }
}

public final class LoginFactory {
    let dependency: LoginDependency
    
    init(dependency: LoginDependency) {
        self.dependency = dependency
    }
    
    func makeView() -> some View {
        let viewModel = LoginViewModel(loginUseCase: dependency.loginUseCase)
        return LoginView(viewModel: viewModel)
    }
}
