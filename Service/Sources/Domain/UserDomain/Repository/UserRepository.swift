import Foundation

public protocol UserRepository {
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func fetchMyInfo() async throws -> MyInfoEntity
}
