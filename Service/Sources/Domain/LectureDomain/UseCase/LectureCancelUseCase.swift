import Foundation

public protocol LectureCancelUseCase {
    func callAsFunction(userID: String) async throws
}
