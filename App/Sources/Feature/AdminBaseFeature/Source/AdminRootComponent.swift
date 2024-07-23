import NeedleFoundation
import SwiftUI

public protocol AdminRootDependency: Dependency {
    var userListFactory: any UserListFactory { get }
    var requestUserSignupFactory: any RequestUserSignupFactory { get }
    var withdrawUserListFactory: any WithdrawUserListFactory { get }
    var schoolListFactory: any SchoolListFactory { get }
    var organizationListFactory: any OrganizationListFactory { get }
    var universityListFactory: any UniversityListFactory { get }
}

public final class AdminRootComponent: Component<AdminRootDependency>, AdminRootFactory {
    public func makeView() -> some View {
        AdminRootView(
            userListFactory: dependency.userListFactory,
            requestUserSignupFactory: dependency.requestUserSignupFactory,
            withdrawUserListFactory: dependency.withdrawUserListFactory,
            schoolListFactory: dependency.schoolListFactory,
            organizationListFactory: dependency.organizationListFactory,
            universityListFactory: dependency.universityListFactory
        )
    }
}
