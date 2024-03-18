import Foundation
import Service

final class AdminUserListViewModel: BaseViewModel {
    @Published var searchName = ""
    @Published var isSelectedUserList = false
    @Published var isPresentedUserTypeFilter: Bool = false
    @Published var selectedAuthority: AdminUserListAuthorityType = .admin
    var userAuthorityType: [AdminUserListAuthorityType] = AdminUserListAuthorityType.allCases
    
    func updateIsPresentedUserTypeFilter(isPresented: Bool) {
        isPresentedUserTypeFilter = isPresented
    }
}
