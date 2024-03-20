import NeedleFoundation
import SwiftUI
import Service

public protocol ChangePasswordDependency: Dependency {
    var changePasswordUseCase: any ChangePasswordUseCase { get }
}

public final class ChangePasswordComponent: Component<ChangePasswordDependency>, ChangePasswordFactory {
    public func makeView() -> some View {
        ChangePasswordView(
            viewModel: .init(
                changePasswordUseCase: dependency.changePasswordUseCase
            )
        )
    }
}
