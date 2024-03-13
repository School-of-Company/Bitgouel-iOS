import Foundation

public protocol WithdrawRepository {
    func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity]
}
