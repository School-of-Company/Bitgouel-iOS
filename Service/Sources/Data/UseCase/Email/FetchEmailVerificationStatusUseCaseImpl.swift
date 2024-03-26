import Foundation

public struct FetchEmailVerificationStatusUseCaseImpl: FetchEmailVertificationStatusUseCase {
    private let emailRepository: any EmailRepository

    public init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }

    public func callAsFunction(email: String) async throws -> Bool {
        try await emailRepository.fetchEmailVerificationStatus(email: email)
    }
}
