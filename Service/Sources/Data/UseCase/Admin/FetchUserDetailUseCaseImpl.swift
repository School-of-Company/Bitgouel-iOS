import Foundation

public struct FetchUserDetailUseCaseImpl: FetchUserDetailUseCase {
    private let adminRepository: AdminRepository

    public init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    public func callAsFunction(userID: String) async throws -> UserInfoEntity {
        try await adminRepository.fetchUserDetail(userID: userID)
    }
}
