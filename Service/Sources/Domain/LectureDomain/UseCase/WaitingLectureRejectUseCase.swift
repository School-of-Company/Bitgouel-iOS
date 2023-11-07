import Foundation

public protocol WaitingLectureRejectUseCase {
    func callAsFunction(userID: String) async throws
}
