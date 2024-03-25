import NeedleFoundation
import SwiftUI
import Service

public protocol NewPasswordDependency: Dependency {
    var findPasswordUseCase: any FindPasswordUseCase { get }
}

public final class NewPasswordComponent: Component<NewPasswordDependency>, NewPasswordFactory {
    public func makeView(
        email: String
    ) -> some View {
        NewPasswordView(
            viewModel: .init(
                email: email,
                findPasswordUseCase: dependency.findPasswordUseCase
            )
        )
    }
}
