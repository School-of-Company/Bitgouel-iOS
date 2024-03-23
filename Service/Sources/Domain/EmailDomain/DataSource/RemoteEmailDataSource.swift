import Foundation

public protocol RemoteEmailDataSource: BaseRemoteDataSource<EmailAPI> {
    func sendEmailCertificationLink(req: EmailRequestDTO) async throws
    func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity
}
