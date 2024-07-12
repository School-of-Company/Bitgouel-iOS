import Foundation
import Service

final class RequestUserSignupViewModel: BaseViewModel {
    @Published var isShowingApproveAlert: Bool = false
    @Published var isShowingRejectAlert: Bool = false
    @Published var isSelectedUserList: Bool = false
    @Published var isShowingAdminPageBottomSheet = false
    @Published var selectedPage: AdminPageFlow = .requestUser
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

    func updateIsSelectedUserList(isSelected: Bool) {
        isSelectedUserList = isSelected
    }

    func updateIsShowingApproveAlert(isShowing: Bool) {
        isShowingApproveAlert = isShowing
    }

    func updateIsShowingRejectAlert(isShowing: Bool) {
        isShowingRejectAlert = isShowing
    }

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
        selectedPage = page
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

    @MainActor
    func approveUserSignupButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                try await approveUserSignupUseCase(userID: Array(selectedUserList).joined(separator: ","))

                success()
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func rejectUserSignupButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                try await rejectUserSignupUseCase(userID: Array(selectedUserList).joined(separator: ","))

                success()
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
