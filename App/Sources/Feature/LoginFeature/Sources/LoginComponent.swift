import NeedleFoundation
import Service
import SwiftUI

public protocol LoginDependency: Dependency {
    var loginUseCase: any LoginUseCase { get }
    var signupFactory: any SignUpFactory { get }
    var saveUserAuthorityUseCase: any SaveUserAuthorityUseCase { get }
    var findPasswordFactory: any FindPasswordFactory { get }
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
}

public final class LoginComponent: Component<LoginDependency>, LoginFactory {
    public func makeView() -> some View {
        LoginView(
            viewModel: .init(
                loginUseCase: dependency.loginUseCase,
                saveUserAuthority: dependency.saveUserAuthorityUseCase,
                reissueTokenUseCase: dependency.reissueTokenUseCase
            ),
            signupFactory: dependency.signupFactory,
            findPasswordFactory: dependency.findPasswordFactory
        )
    }
}
