import NeedleFoundation
import Service
import SwiftUI

public protocol AdminWithdrawUserListDependency: Dependency {
    var adminUserListFactory: any AdminUserListFactory { get }
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory { get }
    var fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase { get }
    var withdrawUserUseCase: any WithdrawUserUseCase { get }
}

public final class AdminWithdrawUserListComponent: Component<AdminWithdrawUserListDependency>, AdminWithdrawUserListFactory {
    @MainActor
    public func makeView() -> some View {
        AdminWithdrawUserListView(
            viewModel: .init(
                fetchWithdrawUserListUseCase: dependency.fetchWithdrawUserListUseCase,
                withdrawUserUseCase: dependency.withdrawUserUseCase
            ),
            adminUserListFactory: dependency.adminUserListFactory,
            adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
        )
    }
}
