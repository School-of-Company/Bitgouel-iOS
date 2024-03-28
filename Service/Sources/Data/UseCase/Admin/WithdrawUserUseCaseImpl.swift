import Foundation

public struct WithdrawUserUseCaseImpl: WithdrawUserUseCase {
    private let adminRepository: AdminRepository

    public init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await adminRepository.withdrawUserSignup(userID: userID)
    }
}
