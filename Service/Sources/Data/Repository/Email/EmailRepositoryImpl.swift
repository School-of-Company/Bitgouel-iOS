import Foundation

public struct EmailRepositoryImpl: EmailRepository {
    private let remoteEmailDataSource: any RemoteEmailDataSource

    public init(remoteEmailDataSource: any RemoteEmailDataSource) {
        self.remoteEmailDataSource = remoteEmailDataSource
    }

    public func sendEmailCertificationLink(email: String) async throws {
        try await remoteEmailDataSource.sendEmailCertificationLink(email: email)
    }

    public func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity {
        try await remoteEmailDataSource.fetchEmailVerificationStatus(email: email)
    }
}
