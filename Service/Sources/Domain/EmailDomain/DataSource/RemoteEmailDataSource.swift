import Foundation

public protocol RemoteEmailDataSource: BaseRemoteDataSource<EmailAPI> {
    func sendEmailCertificationLink(email: String) async throws
    func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity
}
