import Foundation

public protocol FetchUserDetailUseCase {
    func callAsFunction(userID: String) async throws -> UserDetailInfoEntity
}
