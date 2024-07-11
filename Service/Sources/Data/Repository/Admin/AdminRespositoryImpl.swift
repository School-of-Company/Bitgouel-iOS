import Foundation

public struct AdminRespositoryImpl: AdminRepository {
    private let remoteAdminDataSource: RemoteAdminDataSource

    public init(remoteAdminDataSource: RemoteAdminDataSource) {
        self.remoteAdminDataSource = remoteAdminDataSource
    }

    public func fetchUserList(
        keyword: String,
        authority: String,
        approveStatus: String
    ) async throws -> [UserInfoEntity] {
        try await remoteAdminDataSource.fetchUserList(
            keyword: keyword,
            authority: authority,
            approveStatus: approveStatus
        )
    }

    public func fetchUserDetail(userID: String) async throws -> UserDetailInfoEntity {
        try await remoteAdminDataSource.fetchUserDetail(userID: userID)
    }

    public func approveUserSignup(userID: String) async throws {
        try await remoteAdminDataSource.approveUserSignup(userID: userID)
    }

    public func rejectUserSignup(userID: String) async throws {
        try await remoteAdminDataSource.rejectUserSignup(userID: userID)
    }

    public func withdrawUserSignup(userID: String) async throws {
        try await remoteAdminDataSource.withdrawUserSignup(userID: userID)
    }
}
