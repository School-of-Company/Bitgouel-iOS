import Foundation

public protocol FetchWithdrawUserListUseCase {
    func callAsFunction(cohort: String) async throws -> [WithdrawUserInfoEntity]
}
