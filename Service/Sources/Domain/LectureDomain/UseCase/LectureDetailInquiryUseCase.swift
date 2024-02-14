import Foundation

public protocol QueryLectureDetailUseCase {
    func callAsFunction(userID: String) async throws
}
