import Foundation

public final class RemoteEmailDataSourceImpl: BaseRemoteDataSource<EmailAPI>, RemoteEmailDataSource {
    public func sendEmailCertificationLink(email: String) async throws {
        try await request(.fetchEmailVerificationStatus(email: email))
    }
    
    public func fetchEmailVerificationStatus(email: String) async throws -> EmailVerificationStatusEntity {
        try await request(.fetchEmailVerificationStatus(email: email), dto: FetchEmailVerificationStatusResponseDTO.self).toDomain()
    }
}
