import SwiftUI

struct AdminRootView: View {
    @EnvironmentObject var adminPageState: AdminPageState

    private let userListFactory: any UserListFactory
    private let requestUserSignupFactory: any RequestUserSignupFactory
    private let withdrawUserListFactory: any WithdrawUserListFactory
    private let schoolListFactory: any SchoolListFactory
    private let companyListFactory: any CompanyListFactory
    private let universityListFactory: any UniversityListFactory
    private let governmentListFactory: any GovernmentListFactory

    public init(
        userListFactory: any UserListFactory,
        requestUserSignupFactory: any RequestUserSignupFactory,
        withdrawUserListFactory: any WithdrawUserListFactory,
        schoolListFactory: any SchoolListFactory,
        companyListFactory: any CompanyListFactory,
        universityListFactory: any UniversityListFactory,
        governmentListFactory: any GovernmentListFactory
    ) {
        self.userListFactory = userListFactory
        self.requestUserSignupFactory = requestUserSignupFactory
        self.withdrawUserListFactory = withdrawUserListFactory
        self.schoolListFactory = schoolListFactory
        self.companyListFactory = companyListFactory
        self.universityListFactory = universityListFactory
        self.governmentListFactory = governmentListFactory
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
                companyListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .university:
                universityListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)

            case .government:
                governmentListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(adminPageState)
            }
        }
        .animation(.default, value: adminPageState.adminPageFlow)
    }
}
