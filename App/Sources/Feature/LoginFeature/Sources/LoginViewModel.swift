import Foundation
import Service

final class LoginViewModel: BaseViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var isPresentedSignupPage: Bool = false
    @Published var isPresentedFindPasswordPage: Bool = false
    @Published var isSuccessSignin: Bool = false
    @Published var isEmailErrorOccured: Bool = false
    @Published var isPasswordErrorOcuured: Bool = false

    private let loginUseCase: any LoginUseCase
    private let saveUserAuthority: any SaveUserAuthorityUseCase
    private let reissueTokenUseCase: any ReissueTokenUseCase

    init(
        loginUseCase: any LoginUseCase,
        saveUserAuthority: any SaveUserAuthorityUseCase,
        reissueTokenUseCase: any ReissueTokenUseCase
    ) {
        self.loginUseCase = loginUseCase
        self.saveUserAuthority = saveUserAuthority
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    var isFormEmpty: Bool {
        email.isEmpty || password.isEmpty
    }

    var emailHelpMessage: String {
        if isEmailErrorOccured {
            return "잘못된 이메일입니다."
        } else if isErrorOccurred == true {
            return "아직 승인되지 않은 계정입니다."
        } else {
            return ""
        }
    }

    var passwordHelpMessage: String {
        if isPasswordErrorOcuured {
            return "잘못된 비밀번호입니다"
        } else {
            return "비밀번호를 잊었나요?"
        }
    }

    func updateIsPresentedSignupPage(isPresented: Bool) {
        isPresentedSignupPage = isPresented
    }

    func updateIsPresentedFindPasswordPage(isPresented: Bool) {
        isPresentedFindPasswordPage = isPresented
    }

    func updateIsEmailErrorOccured(isErrorOccured: Bool) {
        isEmailErrorOccured = isErrorOccured
    }

    func updateIsPasswordErrorOccured(isErrorOccured: Bool) {
        isPasswordErrorOcuured = isErrorOccured
    }

    @MainActor
    func login() {
        guard email.checkEmail() else { return updateIsEmailErrorOccured(isErrorOccured: true) }
        guard password.checkPassword() else { return updateIsPasswordErrorOccured(isErrorOccured: true) }

        Task {
            do {
                let userLoginInfo = try await self.loginUseCase(req: LoginRequestDTO(email: email, password: password))

                saveUserAuthority(authority: userLoginInfo.authority)
                isSuccessSignin = true
            } catch {
                errorMessage = error.authDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                try await reissueTokenUseCase()

                isSuccessSignin = true
            } catch {
                print(String(describing: error))
            }
        }
    }
}
