import Foundation

public protocol RemoteWithdrawDataSource: BaseRemoteDataSource<WithdrawAPI> {
    func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity]
}
