import NeedleFoundation
import Service
import SwiftUI

public protocol ChangePasswordDependency: Dependency {
    var successChangePasswordFactory: any SuccessChangePasswordFactory { get }
    var changePasswordUseCase: any ChangePasswordUseCase { get }
}

public final class ChangePasswordComponent: Component<ChangePasswordDependency>, ChangePasswordFactory {
    public func makeView() -> some View {
        ChangePasswordView(
            viewModel: .init(
                changePasswordUseCase: dependency.changePasswordUseCase
            ),
            successChangePasswordFactory: dependency.successChangePasswordFactory
        )
    }
}
