import NeedleFoundation
import Service
import SwiftUI

public protocol WithdrawUserListDependency: Dependency {
    var userListFactory: any UserListFactory { get }
    var requestUserSignupFactory: any RequestUserSignupFactory { get }
    var fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase { get }
    var withdrawUserUseCase: any WithdrawUserUseCase { get }
}

public final class WithdrawUserListComponent:
    Component<WithdrawUserListDependency>, WithdrawUserListFactory {
    @MainActor
    public func makeView() -> some View {
        WithdrawUserListView(
            viewModel: .init(
                fetchWithdrawUserListUseCase: dependency.fetchWithdrawUserListUseCase,
                withdrawUserUseCase: dependency.withdrawUserUseCase
            ),
            userListFactory: dependency.userListFactory,
            requestUserSignupFactory: dependency.requestUserSignupFactory
        )
    }
}
