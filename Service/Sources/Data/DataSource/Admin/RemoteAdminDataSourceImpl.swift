import Foundation

public final class RemoteAdminDataSourceImpl: BaseRemoteDataSource<AdminAPI>, RemoteAdminDataSource {
    public func fetchUserList(
        keyword: String,
        authority: String,
        approveStatus: String
    ) async throws -> [UserInfoEntity] {
        try await request(
            .fetchUserList(keyword: keyword, authority: authority, approveStatus: approveStatus),
            dto: FetchUserInfoResponseDTO.self
        ).toDomain()
    }

    public func fetchUserDetail(userID: String) async throws -> UserDetailInfoEntity {
        try await request(
            .fetchUserDetail(userID: userID),
            dto: UserDetailInfoResponseDTO.self
        ).toDomain()
    }

    public func approveUserSignup(userID: String) async throws {
        try await request(.approveUserSignup(userID: userID))
    }

    public func rejectUserSignup(userID: String) async throws {
        try await request(.rejectUserSignup(userID: userID))
    }

    public func withdrawUserSignup(userID: String) async throws {
        try await request(.withdrawUserSignup(userID: userID))
    }
}
