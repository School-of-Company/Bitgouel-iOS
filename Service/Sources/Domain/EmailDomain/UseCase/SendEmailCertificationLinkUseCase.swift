import Foundation

public protocol SendEmailCertificationLinkUseCase {
    func callAsFunction(req: EmailRequestDTO) async throws
}
