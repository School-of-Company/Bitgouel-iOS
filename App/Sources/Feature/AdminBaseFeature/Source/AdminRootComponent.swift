import NeedleFoundation
import SwiftUI

public protocol AdminRootDependency: Dependency {
    var userListFactory: any UserListFactory { get }
    var requestUserSignupFactory: any RequestUserSignupFactory { get }
    var withdrawUserListFactory: any WithdrawUserListFactory { get }
    var schoolListFactory: any SchoolListFactory { get }
    var companyListFactory: any CompanyListFactory { get }
    var universityListFactory: any UniversityListFactory { get }
    var governmentListFactory: any GovernmentListFactory { get }
}

public final class AdminRootComponent: Component<AdminRootDependency>, AdminRootFactory {
    public func makeView() -> some View {
        AdminRootView(
            userListFactory: dependency.userListFactory,
            requestUserSignupFactory: dependency.requestUserSignupFactory,
            withdrawUserListFactory: dependency.withdrawUserListFactory,
            schoolListFactory: dependency.schoolListFactory,
            companyListFactory: dependency.companyListFactory,
            universityListFactory: dependency.universityListFactory,
            governmentListFactory: dependency.governmentListFactory
        )
    }
}
