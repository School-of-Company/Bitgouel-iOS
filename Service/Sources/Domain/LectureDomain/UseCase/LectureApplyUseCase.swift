import Foundation

public protocol LectureApplyUseCase {
    func callAsFunction(userID: String) async throws
}
