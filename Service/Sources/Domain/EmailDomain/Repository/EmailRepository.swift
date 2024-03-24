import Foundation

public protocol EmailRepository {
    func sendEmailCertificationLink(req: EmailRequestDTO) async throws
    func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity
}
