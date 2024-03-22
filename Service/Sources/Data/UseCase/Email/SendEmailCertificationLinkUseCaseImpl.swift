import Foundation

public struct SendEmailCertificationLinkUseCaseImpl: SendEmailCertificationLinkUseCase {
    private let emailRepository: any EmailRepository
    
    public init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }
    
    public func callAsFunction(email: String) async throws {
        try await emailRepository.sendEmailCertificationLink(email: email)
    }
}
