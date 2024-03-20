import NeedleFoundation
import Service
import SwiftUI

public protocol AdminUserListDependency: Dependency {
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory { get }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory { get }
}

public final class AdminUserListComponent: Component<AdminUserListDependency>, AdminUserListFactory {
    @MainActor
    public func makeView() -> some View {
        AdminUserListView(
            viewModel: .init(
                adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory,
                adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
            ),
            adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory,
            adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
        )
    }
}
