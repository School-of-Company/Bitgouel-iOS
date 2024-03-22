import Foundation

public protocol FetchEmailVertificationStatus {
    func callAsFunction(email: String) async throws -> EmailVerificationStatusEntity
}
