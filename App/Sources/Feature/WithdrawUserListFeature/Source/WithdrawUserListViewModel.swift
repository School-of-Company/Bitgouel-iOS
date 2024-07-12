import Foundation
import Service

final class WithdrawUserListViewModel: BaseViewModel {
    @Published var isShowingWithdrawAlert: Bool = false
    @Published var isSelectedUserList = false
    @Published var isPresentedUserCohortBottomSheet: Bool = true
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

    func updateIsPresentedCohortBottomSheet(isPresented: Bool) {
        isPresentedUserCohortBottomSheet = isPresented
    }

    func updateIsShowingWithdrawAlert(isShowing: Bool) {
        isShowingWithdrawAlert = isShowing
    }

    func updateIsSelectedUserList(isSelected: Bool) {
        isSelectedUserList = isSelected
    }

    func withdrawUser(_ success: @escaping () -> Void) {
        Task {
            do {
                try await withdrawUserUseCase(userID: selectedWithdrawUserList.joined(separator: ","))

                success()
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                userList = try await fetchWithdrawUserListUseCase(cohort: selectedCohort.description)
            } catch {
                print(error.localizedDescription)
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
