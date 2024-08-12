import Foundation
import Service

final class FindPasswordViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var isPresentedSendEmailPage: Bool = false
    @Published var isPresentedNewPasswordPage: Bool = false
    @Published var isEmailErrorOccurred: Bool = false

    private let sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase
    private let fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase

    init(
        sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase,
        fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase
    ) {
        self.sendEmailCertificationLinkUseCase = sendEmailCertificationLinkUseCase
        self.fetchEmailVertificationStatusUseCase = fetchEmailVertificationStatusUseCase
    }

    var isEmailEmpty: Bool {
        email.isEmpty
    }

    var emailHelpMessage: String {
        if isEmailErrorOccurred {
            guard email.checkEmail() else { return "잘못된 이메일입니다." }

            return "이메일로 가입된 유저를 찾을 수 없습니다."
        } else {
            return ""
        }
    }

    func updateIsPresentedSendEmailPage(isPresented: Bool) {
        isPresentedSendEmailPage = isPresented
    }

    func updateIsPresentedNewPasswordPage(isPresented: Bool) {
        isPresentedNewPasswordPage = isPresented
    }

    func updateIsEmailErrorOccurred(isErrorOccurred: Bool) {
        isEmailErrorOccurred = isErrorOccurred
    }

    @MainActor
    func nextToButtonDidTap(_ success: @escaping () -> Void) {
        guard email.checkEmail() else {
            return updateIsEmailErrorOccurred(isErrorOccurred: true)
        }

        Task {
            do {
                try await sendEmailCertificationLinkUseCase(req: EmailRequestDTO(email: email))

                success()
            } catch {
                updateIsEmailErrorOccurred(isErrorOccurred: true)
            }
        }
    }

    @MainActor
    func checkEmailVertificationStatus() {
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
