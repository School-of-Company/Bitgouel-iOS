import Foundation

public protocol FindPasswordUseCase {
    func callAsFunction(email: String, newPassword: String) async throws
}
