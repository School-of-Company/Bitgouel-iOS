import Foundation

public protocol ApproveUserSignupUseCase {
    func callAsFunction(userID: String) async throws
}
