import Foundation

final class ChangePasswordViewModel: BaseViewModel {
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var checkNewPassword: String = ""

    func changePasswordButtonDidTap() {
        #warning("비밀번호 변경 action")
    }
}
