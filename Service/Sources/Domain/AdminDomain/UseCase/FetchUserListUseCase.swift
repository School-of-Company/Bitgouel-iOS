import Foundation

public protocol FetchUserListUseCase {
    func callAsFunction(keyword: String, authority: String, approveStatus: String) async throws -> [UserInfoEntity]
}
