import Foundation
import Service

final class ChangePasswordViewModel: BaseViewModel {
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var checkNewPassword: String = ""
    @Published var isPresentedSuccessView: Bool = false
    @Published var isCurrentPasswordErrorOccurred: Bool = false
    @Published var isNewPasswordErrorOccurred: Bool = false

    private let changePasswordUseCase: any ChangePasswordUseCase

    init(changePasswordUseCase: any ChangePasswordUseCase) {
        self.changePasswordUseCase = changePasswordUseCase
    }

    var currentPasswordHelpMessage: String {
        if isCurrentPasswordErrorOccurred {
            return "잘못된 비밀번호입니다."
        } else {
            return ""
        }
    }

    var newPasswordHelpMessage: String {
        if isNewPasswordErrorOccurred {
            return "8~24자 이내의 영문 / 숫자, 특수문자 1개 이상"
        } else {
            return ""
        }
    }

    func updateIsPresentedSuccessView(isPresented: Bool) {
        isPresentedSuccessView = isPresented
    }

    func checkPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    func updateIsCurrentPasswordErrorOccurred(isErrorOccurred: Bool) {
        isCurrentPasswordErrorOccurred = isErrorOccurred
    }

    func updateIsNewPasswordErrorOccurred(isErrorOccurred: Bool) {
        isNewPasswordErrorOccurred = isErrorOccurred
    }

    @MainActor
    func changePasswordButtonDidTap() {
        guard newPassword == checkNewPassword else {
            errorMessage = "비밀번호가 일치하지 않습니다."
            return isErrorOccurred = true
        }
        guard checkPassword(currentPassword) else {
            return updateIsCurrentPasswordErrorOccurred(isErrorOccurred: true)
        }
        guard checkPassword(newPassword) && checkPassword(checkNewPassword) else {
            return updateIsNewPasswordErrorOccurred(isErrorOccurred: true)
        }

        Task {
            do {
                try await changePasswordUseCase(
                    req: ChangePasswordRequestDTO(
                        currentPassword: currentPassword,
                        newPassword: newPassword
                    )
                )

                updateIsPresentedSuccessView(isPresented: true)
            } catch {
                errorMessage = error.userDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
