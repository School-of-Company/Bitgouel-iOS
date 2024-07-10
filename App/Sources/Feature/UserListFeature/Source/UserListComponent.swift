import NeedleFoundation
import Service
import SwiftUI

public protocol UserListDependency: Dependency {
    var requestUserSignupFactory: any RequestUserSignupFactory { get }
    var withdrawUserListFactory: any WithdrawUserListFactory { get }
    var fetchUserListUseCase: any FetchUserListUseCase { get }
}

public final class UserListComponent: Component<UserListDependency>, UserListFactory {
    @MainActor
    public func makeView() -> some View {
        UserListView(
            viewModel: .init(
                fetchUserListUseCase: dependency.fetchUserListUseCase
            ),
            withdrawUserListFactory: dependency.withdrawUserListFactory,
            requestUserSignupFactory: dependency.requestUserSignupFactory
        )
    }
}
