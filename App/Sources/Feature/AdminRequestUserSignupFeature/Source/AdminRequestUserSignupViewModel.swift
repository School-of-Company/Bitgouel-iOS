import Foundation
import Service

final class AdminRequestUserSignupViewModel: BaseViewModel {
    @Published var isShowingApproveAlert: Bool = false
    @Published var isShowingRejectAlert: Bool = false
    @Published var isSelectedUserList: Bool = false
    @Published var isNavigateUserListDidTap: Bool = false
    @Published var isNavigateWithdrawListDidTap: Bool = false
    @Published var userList: [UserInfoEntity] = []

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

    @MainActor
    func onAppear() {
        Task {
            do {
                userList = try await fetchUserListUseCase(
                    keyword: "",
                    authority: "",
                    approveStatus: approveStatus.rawValue
                )
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
