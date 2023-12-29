import Foundation
import Service

final class LoginViewModel: BaseViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var isPresentedSignupPage: Bool = false
    private let loginUseCase: any LoginUseCase
    private let saveUserAuthority: any SaveUserAuthorityUseCase

    init(
        loginUseCase: any LoginUseCase,
        saveUserAuthority: any SaveUserAuthorityUseCase
    ) {
        self.loginUseCase = loginUseCase
        self.saveUserAuthority = saveUserAuthority
    }

    var isFormEmpty: Bool {
        email.isEmpty || password.isEmpty
    }

    var isEmailErrorOccured: Bool {
        if email.isEmpty {
            return false
        }

        if checkEmail(email) {
            return false
        } else {
            return true
        }
    }

    var isPasswordErrorOcuured: Bool {
        if password.isEmpty {
            return false
        }

        if checkPassword(password) {
            return false
        } else {
            return true
        }
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

    func checkEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func checkPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    func updateIsPresentedSignupPage(isPresented: Bool) {
        self.isPresentedSignupPage = isPresented
    }

    func signupPageIsRequired() {
        self.isPresentedSignupPage = true
    }

    func signupPageDismissed() {
        self.isPresentedSignupPage = false
    }

    func login() {
        guard checkEmail(email) && checkPassword(password) else { return }

        Task {
            do {
                let userLoginInfo = try await self.loginUseCase(req: LoginRequestDTO(email: email, password: password))
                saveUserAuthority(authority: userLoginInfo.authority)
                print("로그인 성공 \(userLoginInfo.authority)")
            } catch {
                isErrorOccurred = true
                print("로그인 실패: \(error)")
            }
        }
    }
}
