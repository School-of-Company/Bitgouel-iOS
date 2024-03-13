import Foundation

public final class RemoteWithdrawDataSourceImpl: BaseRemoteDataSource<WithdrawAPI>, RemoteWithdrawDataSource {
    public func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity] {
        try await request(.fetchWithdrawUserList(cohort: cohort), dto: FetchWithdrawUserListResponseDTO.self).toDomain()
    }
}
