import Foundation

public struct RejectUserSignupUseCaseImpl: RejectUserSignupUseCase {
    private let adminRepository: AdminRepository

    public init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    public func callAsFunction(userID: [String]) async throws {
        try await adminRepository.rejectUserSignup(userID: userID)
    }
}
