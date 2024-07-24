import SwiftUI

struct AdminRootView: View {
    @EnvironmentObject var adminPageState: AdminPageState

    private let userListFactory: any UserListFactory
    private let requestUserSignupFactory: any RequestUserSignupFactory
    private let withdrawUserListFactory: any WithdrawUserListFactory
    private let schoolListFactory: any SchoolListFactory
    private let organizationListFactory: any OrganizationListFactory
    private let universityListFactory: any UniversityListFactory

    public init(
        userListFactory: any UserListFactory,
        requestUserSignupFactory: any RequestUserSignupFactory,
        withdrawUserListFactory: any WithdrawUserListFactory,
        schoolListFactory: any SchoolListFactory,
        organizationListFactory: any OrganizationListFactory,
        universityListFactory: any UniversityListFactory
    ) {
        self.userListFactory = userListFactory
        self.requestUserSignupFactory = requestUserSignupFactory
        self.withdrawUserListFactory = withdrawUserListFactory
        self.schoolListFactory = schoolListFactory
        self.organizationListFactory = organizationListFactory
        self.universityListFactory = universityListFactory
    }

    var body: some View {
        Group {
            switch adminPageState.adminPageFlow {
            case .user:
                userListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .requestUser:
                requestUserSignupFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .withdrawUser:
                withdrawUserListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .school:
                schoolListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .company:
                organizationListFactory.makeView(type: .company, selectedPage: .company)
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .university:
                universityListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .government:
                organizationListFactory.makeView(type: .government, selectedPage: .government)
                    .eraseToAnyView()
                    .environmentObject(adminPageState)
            }
        }
        .animation(.default, value: adminPageState.adminPageFlow)
    }
}
