import SwiftUI
import NeedleFoundation
import Service

public protocol LoginDependency: Dependency {
    var loginUseCase: any LoginUseCase { get }
}

public final class LoginComponent: Component<LoginDependency>, LoginFactory {
    public func makeView() -> some View {
        LoginView(
            viewModel: .init(
                loginUseCase: dependency.loginUseCase
            )
        )
    }
}
