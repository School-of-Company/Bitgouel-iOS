import Foundation

public protocol UserRepository {
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func queryMyInfo() async throws -> MyInfoEntity
}
