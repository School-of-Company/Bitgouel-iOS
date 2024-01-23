import Foundation

public protocol WaitingLectureApproveUseCase {
    func callAsFunction(userID: String) async throws
}
