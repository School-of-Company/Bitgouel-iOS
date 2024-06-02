import Foundation
import Service

final class AdminRequestUserSignupViewModel: BaseViewModel {
    @Published var isShowingApproveAlert: Bool = false
    @Published var isShowingRejectAlert: Bool = false
    @Published var isSelectedUserList: Bool = false
    @Published var isNavigateUserListDidTap: Bool = false
    @Published var isNavigateWithdrawListDidTap: Bool = false
    @Published var userList: [UserInfoEntity] = []
    @Published var selectedUserList: Set<String> = []

    let approveStatus: ApproveStatusType = .pending
    private let fetchUserListUseCase: any FetchUserListUseCase
    private let approveUserSignupUseCase: any ApproveUserSignupUseCase
    private let rejectUserSignupUseCase: any RejectUserSignupUseCase

    init(
        fetchUserListUseCase: any FetchUserListUseCase,
        approveUserSignupUseCase: any ApproveUserSignupUseCase,
        rejectUserSignupUseCase: any RejectUserSignupUseCase
    ) {
        self.fetchUserListUseCase = fetchUserListUseCase
        self.approveUserSignupUseCase = approveUserSignupUseCase
        self.rejectUserSignupUseCase = rejectUserSignupUseCase
    }

    func insertAllUserList() {
        let userIDs = userList.map(\.userID)
        selectedUserList.formUnion(userIDs)
    }

    func removeAllUserList() {
        selectedUserList.removeAll()
    }

    func insertUserList(userID: String) {
        selectedUserList.insert(userID)
    }

    func removeUserList(userID: String) {
        selectedUserList.remove(userID)
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                userList = try await fetchUserListUseCase(
                    keyword: "",
                    authority: "",
                    approveStatus: approveStatus.rawValue
                )
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func approveUserSignupButtonDidTap() {
        Task {
            do {
                try await approveUserSignupUseCase(userID: Array(selectedUserList).joined(separator: ","))
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func rejectUserSignupButtonDidTap() {
        Task {
            do {
                try await rejectUserSignupUseCase(userID: Array(selectedUserList).joined(separator: ","))
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func userListPageDismissed() {
        isNavigateUserListDidTap = false
    }

    @MainActor
    func withdrawListPageDismissed() {
        isNavigateWithdrawListDidTap = false
    }
}
