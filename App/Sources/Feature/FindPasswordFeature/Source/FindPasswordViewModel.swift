import Foundation
import Service

final class FindPasswordViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var isPresentedSendEmailPage: Bool = false
    @Published var isPresentedNewPasswordPage: Bool = false
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

    func updateIsPresentedSendEmailPage(isPresented: Bool) {
        isPresentedSendEmailPage = isPresented
    }

    func updateIsPresentedNewPasswordPage(isPresented: Bool) {
        isPresentedNewPasswordPage = isPresented
    }

    func nextToButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                try await sendEmailCertificationLinkUseCase(req: EmailRequestDTO(email: email))

                success()
            } catch {
                errorMessage = error.userDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func nextToButtonAction() {
        Task {
            do {
                let isAuthentication = try await fetchEmailVertificationStatusUseCase(email: email)

                if isAuthentication {
                    updateIsPresentedNewPasswordPage(isPresented: true)
                } else {
                    errorMessage = "다시 인증해주세요."
                    isErrorOccurred = true
                }
            } catch {
                errorMessage = "다시 인증해주세요."
                isErrorOccurred = true
            }
        }
    }
}
