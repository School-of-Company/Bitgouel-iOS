import Foundation

public protocol EmailRepository {
    func sendEmailCertificationLink(email: String) async throws
    func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity
}
