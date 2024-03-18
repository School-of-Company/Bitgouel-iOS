import Foundation
import Service

final class AdminWithdrawUserListViewModel: BaseViewModel {
    @Published var isWithdraw: Bool = false
    @Published var isSelectedUserList = false
    @Published var isPresentedUserCohortFilter: Bool = false
    @Published var selectedCohort: CohortList = .first
    var cohortList: [CohortList] = CohortList.allCases
    
    func updateIsPresentedCohortFilter(isPresented: Bool) {
        isPresentedUserCohortFilter = isPresented
    }
}
