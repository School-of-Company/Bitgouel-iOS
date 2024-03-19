import NeedleFoundation
import Service
import SwiftUI

public protocol AdminRequestUserSignupDependency: Dependency {
    var adminUserListFactory: any AdminUserListFactory { get }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory { get }
}

public final class AdminRequestUserSignupComponent: Component<AdminRequestUserSignupDependency>, AdminRequestUserSignupFactory {
    @MainActor
    public func makeView() -> some View {
        AdminRequestUserSignupView(
            viewModel: .init(
                adminUserListFactory: dependency.adminUserListFactory,
                adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory
            ),
            adminUserListFactory: dependency.adminUserListFactory,
            adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory
        )
    }
}
