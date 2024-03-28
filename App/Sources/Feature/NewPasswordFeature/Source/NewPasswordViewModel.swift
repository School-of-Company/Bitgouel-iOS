import Foundation
import Service

final class NewPasswordViewModel: BaseViewModel {
    @Published var newPassword: String = ""
    @Published var checkNewPassword: String = ""
    @Published var isPresentedSuccessFindPasswordPage: Bool = false

    var isPasswordEmpty: Bool {
        newPassword.isEmpty || checkNewPassword.isEmpty
    }

    var email: String = ""

    private let findPasswordUseCase: any FindPasswordUseCase

    init(
        email: String,
        findPasswordUseCase: any FindPasswordUseCase
    ) {
        self.email = email
        self.findPasswordUseCase = findPasswordUseCase
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

    @MainActor
    func nextToButtonDidTap() {
        guard newPassword == checkNewPassword else { return }

        Task {
            do {
                try await findPasswordUseCase(req: FindPasswordRequestDTO(email: email, newPassword: newPassword))

                updateIsPresentedSuccessFindPasswordPage(isPresented: true)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
