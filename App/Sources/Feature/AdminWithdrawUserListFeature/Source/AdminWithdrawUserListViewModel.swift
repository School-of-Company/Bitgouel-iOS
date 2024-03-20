import Foundation
import Service

final class AdminWithdrawUserListViewModel: BaseViewModel {
    @Published var isShowingWithdrawAlert: Bool = false
    @Published var isSelectedUserList = false
    @Published var isPresentedUserCohortFilter: Bool = false
    @Published var isNavigateUserListDidTap = false
    @Published var isNavigateRequestSignUpDidTap = false
    @Published var selectedCohort: CohortList = .first
    
    private let adminUserListFactory: any AdminUserListFactory
    private let adminRequestUserSignupFactory: any AdminRequestUserSignupFactory
    var cohortList: [CohortList] = CohortList.allCases
    
    init(
        adminUserListFactory: any AdminUserListFactory,
        adminRequestUserSignupFactory: any AdminRequestUserSignupFactory
    ) {
        self.adminUserListFactory = adminUserListFactory
        self.adminRequestUserSignupFactory = adminRequestUserSignupFactory
    }
    
    func updateIsPresentedCohortFilter(isPresented: Bool) {
        isPresentedUserCohortFilter = isPresented
    }
    
    @MainActor
    func userListPageDismissed() {
        isNavigateUserListDidTap = false
    }
    
    @MainActor
    func requestSignUpPageDismissed() {
        isNavigateRequestSignUpDidTap = false
    }
}
