import NeedleFoundation
import Service
import SwiftUI

public protocol LoginDependency: Dependency {
    var loginUseCase: any LoginUseCase { get }
    var signupFactory: any SignUpFactory { get }
    var saveUserAuthorityUseCase: any SaveUserAuthorityUseCase { get }
    var findPasswordFactory: any FindPasswordFactory { get }
}

public final class LoginComponent: Component<LoginDependency>, LoginFactory {
    public func makeView() -> some View {
        LoginView(
            viewModel: .init(
                loginUseCase: dependency.loginUseCase,
                saveUserAuthority: dependency.saveUserAuthorityUseCase
            ),
            signupFactory: dependency.signupFactory,
            findPasswordFactory: dependency.findPasswordFactory
        )
    }
}
