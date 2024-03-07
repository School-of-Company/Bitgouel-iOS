import Foundation

public protocol WithdrawUserSignupUseCase {
    func callAsFunction(userID: [String]) async throws
}
