import Foundation
import Service

final class AdminWithdrawUserListViewModel: BaseViewModel {
    @Published var isShowingWithdrawAlert: Bool = false
    @Published var isSelectedUserList = false
    @Published var isPresentedUserCohortFilter: Bool = true
    @Published var isNavigateUserListDidTap = false
    @Published var isNavigateRequestSignUpDidTap = false
    @Published var userList: [WithdrawUserInfoEntity] = []
    @Published var selectedWithdrawUserList: Set<String> = []
    @Published var selectedCohort: Int = 0

    var currentYear: Int {
        let currentDate = Date()
        let calendar = Calendar.current
        return calendar.component(.year, from: currentDate)
    }

    private let fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase
    private let withdrawUserUseCase: any WithdrawUserUseCase

    init(
        fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase,
        withdrawUserUseCase: any WithdrawUserUseCase
    ) {
        self.fetchWithdrawUserListUseCase = fetchWithdrawUserListUseCase
        self.withdrawUserUseCase = withdrawUserUseCase
    }

    func insertAllUserList() {
        let userIDs = userList.map(\.userID)
        selectedWithdrawUserList.formUnion(userIDs)
    }

    func removeAllUserList() {
        selectedWithdrawUserList.removeAll()
    }

    func insertUserList(userID: String) {
        selectedWithdrawUserList.insert(userID)
    }

    func removeUserList(userID: String) {
        selectedWithdrawUserList.remove(userID)
    }

    func updateIsPresentedCohortFilter(isPresented: Bool) {
        isPresentedUserCohortFilter = isPresented
    }

    func withdrawUser() {
        Task {
            do {
                try await withdrawUserUseCase(userID: selectedWithdrawUserList.joined(separator: ","))
            } catch {
                print(String(describing: error))
            }
        }
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                userList = try await fetchWithdrawUserListUseCase(cohort: selectedCohort.description)
            } catch {
                print(String(describing: error))
            }
        }
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
