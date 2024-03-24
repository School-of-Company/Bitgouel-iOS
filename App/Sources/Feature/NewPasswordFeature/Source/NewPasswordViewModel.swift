import Foundation

final class NewPasswordViewModel: BaseViewModel {
    @Published var newPassword: String = ""
    @Published var checkNewPassword: String = ""
    @Published var isPresentedSuccessFindPasswordPage: Bool = false

    var isPasswordEmpty: Bool {
        newPassword.isEmpty || checkNewPassword.isEmpty
    }

    func updateNewPassword(password: String) {
        newPassword = password
    }

    func updateCheckNewPassword(password: String) {
        checkNewPassword = password
    }

    func updateIsPresentedSuccessFindPasswordPage(isPresented: Bool) {
        isPresentedSuccessFindPasswordPage = isPresented
    }
}
