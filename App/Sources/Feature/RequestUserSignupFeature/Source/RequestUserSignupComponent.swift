import NeedleFoundation
import Service
import SwiftUI

public protocol RequestUserSignupDependency: Dependency {
    var userListFactory: any UserListFactory { get }
    var withdrawUserListFactory: any WithdrawUserListFactory { get }
    var fetchUserListUseCase: any FetchUserListUseCase { get }
    var approveUserSignupUseCase: any ApproveUserSignupUseCase { get }
    var rejectUserSignupUseCase: any RejectUserSignupUseCase { get }
}

// swiftLint: disable line_length
public final class RequestUserSignupComponent:
    Component<RequestUserSignupDependency>, RequestUserSignupFactory {
    @MainActor
    public func makeView() -> some View {
        RequestUserSignupView(
            viewModel: .init(
                fetchUserListUseCase: dependency.fetchUserListUseCase,
                approveUserSignupUseCase: dependency.approveUserSignupUseCase,
                rejectUserSignupUseCase: dependency.rejectUserSignupUseCase
            ),
            userListFactory: dependency.userListFactory,
            withdrawUserListFactory: dependency.withdrawUserListFactory
        )
    }
}
