import NeedleFoundation
import SwiftUI
import Service

public protocol LoginDependency: Dependency {
    var authDomainBuildable: AuthDomainBuildable { get }
}

public final class LoginComponent: Component<LoginDependency>, LoginBuildable {
    var loginViewModel: LoginViewModel {
        LoginViewModel(
            loginUseCase: dependency.authDomainBuildable.loginUseCase
        )
    }
    
    public var loginView: AnyView {
        return AnyView(
            LoginView(
                viewModel: loginViewModel
            )
        )
    }
}
