import Service
import SwiftUI

final class MyPageViewModel: BaseViewModel {
    @Published var myInfo: MyInfoEntity?
    @Published var isShowingWithdrawAlert: Bool = false
    @Published var isShowingLogoutAlert: Bool = false
    @Published var isPresentedChangePasswordView: Bool = false
    @Published var isPresentedAdminUserListView: Bool = false
    @Published var isShowingLoginAlert: Bool = false

    var authority: UserAuthorityType = .user
    var userInfo: [String] = []
    var userOrganization: String = ""

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchMyInfoUseCase: any FetchMyInfoUseCase
    private let logoutUseCase: any LogoutUseCase
    private let withdrawalUseCase: any WithdrawalUseCase

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchMyInfoUseCase: any FetchMyInfoUseCase,
        logoutUseCase: any LogoutUseCase,
        withdrawalUseCase: any WithdrawalUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchMyInfoUseCase = fetchMyInfoUseCase
        self.logoutUseCase = logoutUseCase
        self.withdrawalUseCase = withdrawalUseCase
    }

    func updateIsPresentedAdminUserListView(isPresented: Bool) {
        isPresentedAdminUserListView = isPresented
    }

    func updateIsPresentedChangePasswordView(isPresented: Bool) {
        isPresentedChangePasswordView = isPresented
    }

    func updateOrganization(organization: String) {
        userInfo = organization.components(separatedBy: "/")

        userOrganization = userInfo.first ?? ""
        userInfo.removeFirst()
    }

    func updateIsShowingWithdrawAlert(isShowing: Bool) {
        isShowingWithdrawAlert = isShowing
    }

    func updateIsShowingLogoutAlert(isShowing: Bool) {
        isShowingLogoutAlert = isShowing
    }

    func updateIsShowingLoginAlert(isShowing: Bool) {
        isShowingLoginAlert = isShowing
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        switch authority {
        case .user:
            updateIsShowingLoginAlert(isShowing: true)

        default:
            Task {
                do {
                    myInfo = try await fetchMyInfoUseCase()

                    updateOrganization(organization: myInfo?.organization ?? "")
                } catch {
                    errorMessage = error.userDomainErrorMessage()
                    isErrorOccurred = true
                }
            }
        }
    }

    @MainActor
    func logout(_ success: @escaping () -> Void) {
        Task {
            do {
                try await logoutUseCase()
                success()
            } catch {
                errorMessage = error.authDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func withdraw(_ success: @escaping () -> Void) {
        Task {
            do {
                try await withdrawalUseCase()
                success()
            } catch {
                errorMessage = error.authDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
