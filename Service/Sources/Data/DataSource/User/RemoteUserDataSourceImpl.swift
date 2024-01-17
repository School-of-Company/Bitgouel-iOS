import Foundation

public final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UserAPI>, RemoteUserDataSource {
    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await request(.changePassword(req))
    }

    public func queryMyInfo() async throws -> MyInfoEntity {
        try await request(.queryMyInfo, dto: QueryMyInfoResponseDTO.self).toDomain()
    }
}
