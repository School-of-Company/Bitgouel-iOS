import Foundation

public protocol RejectUserSignupUseCase {
    func callAsFunction(userID: String) async throws
}
