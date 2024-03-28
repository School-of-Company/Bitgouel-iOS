import Foundation

public struct SendEmailCertificationLinkUseCaseImpl: SendEmailCertificationLinkUseCase {
    private let emailRepository: any EmailRepository

    public init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }

    public func callAsFunction(req: EmailRequestDTO) async throws {
        try await emailRepository.sendEmailCertificationLink(req: req)
    }
}
