import Foundation

public protocol WaitingLectureUseCase {
    func callAsFunction(userID: String) async throws
}
