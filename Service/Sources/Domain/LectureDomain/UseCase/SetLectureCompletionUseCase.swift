import Foundation

public protocol SetLectureCompletionUseCase {
    func callAsFunction(lectureID: String, students: [String]) async throws
}
