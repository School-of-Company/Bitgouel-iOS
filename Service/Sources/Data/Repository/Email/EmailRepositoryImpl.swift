import Foundation

public struct EmailRepositoryImpl: EmailRepository {
    private let remoteEmailDataSource: any RemoteEmailDataSource

    public init(remoteEmailDataSource: any RemoteEmailDataSource) {
        self.remoteEmailDataSource = remoteEmailDataSource
    }

    public func sendEmailCertificationLink(req: EmailRequestDTO) async throws {
        try await remoteEmailDataSource.sendEmailCertificationLink(req: req)
    }

    public func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity {
        try await remoteEmailDataSource.fetchEmailVerificationStatus(email: email)
    }
}
