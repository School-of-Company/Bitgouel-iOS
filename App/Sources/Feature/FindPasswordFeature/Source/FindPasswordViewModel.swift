import Foundation
import Service

final class FindPasswordViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var isPresentedSendEmailPage: Bool = false

    private let sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase

    init(sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase) {
        self.sendEmailCertificationLinkUseCase = sendEmailCertificationLinkUseCase
    }

    func updateEmail(email: String) {
        self.email = email
    }

    func updateIsPresentedSendEmailPage(isPresented: Bool) {
        guard !email.isEmpty else { return }
        isPresentedSendEmailPage = isPresented
    }

    func nextToButtonDidTap() {
        Task {
            do {
                try await sendEmailCertificationLinkUseCase(req: EmailRequestDTO(email: email))
            } catch {
                print(String(describing: error))
            }
        }
    }
}
