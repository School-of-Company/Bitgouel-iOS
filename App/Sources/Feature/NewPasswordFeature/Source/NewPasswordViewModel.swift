import Foundation

final class NewPasswordViewModel: BaseViewModel {
    @Published var newPassword: String = ""
    @Published var checkNewPassword: String = ""
    var isPasswordEmpty: Bool {
        newPassword.isEmpty || checkNewPassword.isEmpty
    }

    func updateNewPassword(password: String) {
        newPassword = password
    }

    func updateCheckNewPassword(password: String) {
        checkNewPassword = password
    }
}
