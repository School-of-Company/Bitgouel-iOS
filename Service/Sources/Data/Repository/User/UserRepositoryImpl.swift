import Foundation

public struct UserRepositoryImpl: UserRepository {
    private let remoteUserDataSource: RemoteUserDataSource

    public init(remoteUserDataSource: RemoteUserDataSource) {
        self.remoteUserDataSource = remoteUserDataSource
    }

    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await remoteUserDataSource.changePassword(req: req)
    }

    public func queryMyInfo() async throws -> MyInfoEntity {
        try await remoteUserDataSource.queryMyInfo()
    }
}
