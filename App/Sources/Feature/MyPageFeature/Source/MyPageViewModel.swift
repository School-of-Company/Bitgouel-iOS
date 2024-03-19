import SwiftUI
import Service

final class MyPageViewModel: BaseViewModel {
    @Published var myInfo: MyInfoEntity?
    @Published var isShowingWithdrawAlert: Bool = false
    @Published var isShowingLogoutAlert: Bool = false
    @Published var isPresentedChangePasswordView: Bool = false
    
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
    
    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                myInfo = try await fetchMyInfoUseCase()
                
                updateOrganization(organization: myInfo?.organization ?? "")
            } catch {
                print(String(describing: error))
            }
        }
    }

    func logout() {
        Task {
            do {
                try await logoutUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func withdraw() {
        Task {
            do {
                try await withdrawalUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
