import Foundation

public struct WithdrawRepositoryImpl: WithdrawRepository {
    private let remoteWithdrawDataSource: RemoteWithdrawDataSource

    public init(remoteWithdrawDataSource: RemoteWithdrawDataSource) {
        self.remoteWithdrawDataSource = remoteWithdrawDataSource
    }

    public func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity] {
        try await remoteWithdrawDataSource.fetchWithdrawUserList(cohort: cohort)
    }
}
