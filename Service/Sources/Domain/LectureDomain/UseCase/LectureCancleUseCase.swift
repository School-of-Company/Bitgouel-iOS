import Foundation

public protocol LectureCancleUseCase {
    func callAsFunction(userID: String) async throws
}
