import Foundation

final class FindPasswordViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var isPresentedSendEmailPage: Bool = false

    func updateEmail(email: String) {
        self.email = email
    }

    func updateIsPresentedSendEmailPage(isPresented: Bool) {
        guard !email.isEmpty else { return }
        isPresentedSendEmailPage = isPresented
    }
}
