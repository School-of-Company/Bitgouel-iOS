import Foundation

public final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UserAPI>, RemoteUserDataSource {
    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await request(.changePassword(req))
    }

    public func fetchMyInfo() async throws -> MyInfoEntity {
        try await request(.fetchMyInfo, dto: FetchMyInfoResponseDTO.self).toDomain()
    }
}
