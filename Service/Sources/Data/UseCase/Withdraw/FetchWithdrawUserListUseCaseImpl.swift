import Foundation

public struct FetchWithdrawUserListUseCaseImpl: FetchWithdrawUserListUseCase {
    private let withdrawRepository: any WithdrawRepository

    public init(withdrawRepository: any WithdrawRepository) {
        self.withdrawRepository = withdrawRepository
    }

    public func callAsFunction(cohort: String) async throws -> [WithdrawUserInfoEntity] {
        try await withdrawRepository.fetchWithdrawUserList(cohort: cohort)
    }
}
