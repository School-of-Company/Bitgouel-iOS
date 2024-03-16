import Foundation

public struct FetchUserListUseCaseImpl: FetchUserListUseCase {
    private let adminRepository: AdminRepository

    public init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    public func callAsFunction(
        keyword: String,
        authority: String,
        approveStatus: String
    ) async throws -> [UserInfoEntity] {
        try await adminRepository.fetchUserList(
            keyword: keyword,
            authority: authority,
            approveStatus: approveStatus
        )
    }
}
