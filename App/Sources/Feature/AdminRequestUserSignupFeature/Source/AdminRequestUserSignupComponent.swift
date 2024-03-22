import NeedleFoundation
import Service
import SwiftUI

public protocol AdminRequestUserSignupDependency: Dependency {
    var adminUserListFactory: any AdminUserListFactory { get }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory { get }
    var fetchUserListUseCase: any FetchUserListUseCase { get }
    var approveUserSignupUseCase: any ApproveUserSignupUseCase { get }
    var rejectUserSignupUseCase: any RejectUserSignupUseCase { get }
}

public final class AdminRequestUserSignupComponent: Component<AdminRequestUserSignupDependency>, AdminRequestUserSignupFactory {
    @MainActor
    public func makeView() -> some View {
        AdminRequestUserSignupView(
            viewModel: .init(
                fetchUserListUseCase: dependency.fetchUserListUseCase,
                approveUserSignupUseCase: dependency.approveUserSignupUseCase,
                rejectUserSignupUseCase: dependency.rejectUserSignupUseCase
            ),
            adminUserListFactory: dependency.adminUserListFactory,
            adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory
        )
    }
}
