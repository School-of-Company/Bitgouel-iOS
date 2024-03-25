import Foundation

public final class RemoteEmailDataSourceImpl: BaseRemoteDataSource<EmailAPI>, RemoteEmailDataSource {
    public func sendEmailCertificationLink(req: EmailRequestDTO) async throws {
        try await request(.sendEmailCertificationLink(req: req))
    }

    public func fetchEmailVerificationStatus(email: String) async throws -> Bool {
        try await request(
            .fetchEmailVerificationStatus(email: email),
            dto: FetchEmailVerificationStatusResponseDTO.self
        ).isAuthentication
    }
}
