import Foundation

public protocol RemoteUserDataSource: BaseRemoteDataSource<UserAPI> {
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func fetchMyInfo() async throws -> MyInfoEntity
}
