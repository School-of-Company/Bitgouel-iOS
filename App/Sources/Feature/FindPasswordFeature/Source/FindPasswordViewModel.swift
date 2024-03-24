import Foundation
import Service

final class FindPasswordViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var isPresentedSendEmailPage: Bool = false
    @Published var isPresentedNewPasswordPage: Bool = false
    var isAuthentication: Bool = false
    var isEmailEmpty: Bool {
        email.isEmpty
    }

    private let sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase
    private let fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase

    init(
        sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase,
        fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase
    ) {
        self.sendEmailCertificationLinkUseCase = sendEmailCertificationLinkUseCase
        self.fetchEmailVertificationStatusUseCase = fetchEmailVertificationStatusUseCase
    }

    func updateEmail(email: String) {
        self.email = email
    }

    func updateIsPresentedSendEmailPage(isPresented: Bool) {
        isPresentedSendEmailPage = isPresented
    }

    func updateIsPresentedNewPasswordPage(isPresented: Bool) {
        isPresentedNewPasswordPage = isPresented
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

    @MainActor
    func nextToButtonAction() {
        Task {
            do {
                isAuthentication = try await fetchEmailVertificationStatusUseCase(email: email)
                
                if isAuthentication { updateIsPresentedNewPasswordPage(isPresented: true) }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
