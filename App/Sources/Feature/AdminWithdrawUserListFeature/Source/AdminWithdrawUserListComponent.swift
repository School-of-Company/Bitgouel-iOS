import NeedleFoundation
import Service
import SwiftUI

public protocol AdminWithdrawUserListDependency: Dependency {
    var adminUserListFactory: any AdminUserListFactory { get }
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory { get }
}

public final class AdminWithdrawUserListComponent: Component<AdminWithdrawUserListDependency>, AdminWithdrawUserListFactory {
    @MainActor
    public func makeView() -> some View {
        AdminWithdrawUserListView(
            viewModel: .init(
                adminUserListFactory: dependency.adminUserListFactory,
                adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
            ),
            adminUserListFactory: dependency.adminUserListFactory,
            adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
        )
    }
}
