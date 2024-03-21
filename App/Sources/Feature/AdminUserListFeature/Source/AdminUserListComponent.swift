import NeedleFoundation
import Service
import SwiftUI

public protocol AdminUserListDependency: Dependency {
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory { get }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory { get }
    var fetchUserListUseCase: any FetchUserListUseCase { get }
}

public final class AdminUserListComponent: Component<AdminUserListDependency>, AdminUserListFactory {
    @MainActor
    public func makeView() -> some View {
        AdminUserListView(
            viewModel: .init(
                fetchUserListUseCase: dependency.fetchUserListUseCase
            ),
            adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory,
            adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
        )
    }
}
