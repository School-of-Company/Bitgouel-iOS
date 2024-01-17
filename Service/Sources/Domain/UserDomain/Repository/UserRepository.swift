import Foundation

public protocol UserRepository {
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func inquiryMyInfo() async throws -> MyInfoEntity
}
