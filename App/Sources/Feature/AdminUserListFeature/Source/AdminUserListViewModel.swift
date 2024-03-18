import Foundation
import Service

final class AdminUserListViewModel: BaseViewModel {
    @Published var searchName = ""
    @Published var isSelectedUserList = false
    @Published var isPresentedUserTypeFilter: Bool = false
    @Published var isNavigateRequestSignUpDidTap = false
    @Published var isNavigateWithdrawListDidTap = false
    @Published var selectedAuthority: AdminUserListAuthorityType = .admin
    
    private let adminWithdrawUserListFactory: any AdminWithdrawUserListFactory
    private let adminRequestUserSignupFactory: any AdminRequestUserSignupFactory
    var userAuthorityType: [AdminUserListAuthorityType] = AdminUserListAuthorityType.allCases
    
    init(
        adminWithdrawUserListFactory: any AdminWithdrawUserListFactory,
        adminRequestUserSignupFactory: any AdminRequestUserSignupFactory
    ) {
        self.adminWithdrawUserListFactory = adminWithdrawUserListFactory
        self.adminRequestUserSignupFactory = adminRequestUserSignupFactory
    }
    
    func updateIsPresentedUserTypeFilter(isPresented: Bool) {
        isPresentedUserTypeFilter = isPresented
    }
    
    @MainActor
    func requestSignUpPageDismissed() {
        isNavigateRequestSignUpDidTap = false
    }
    
    @MainActor
    func withdrawListPageDismissed() {
        isNavigateWithdrawListDidTap = false
    }
}
