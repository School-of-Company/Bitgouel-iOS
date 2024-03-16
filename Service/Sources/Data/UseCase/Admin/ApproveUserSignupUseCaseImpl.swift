import Foundation

public struct ApproveUserSignupUseCaseImpl: ApproveUserSignupUseCase {
    private let adminRepository: AdminRepository

    public init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    public func callAsFunction(userID: [String]) async throws {
        try await adminRepository.approveUserSignup(userID: userID)
    }
}
