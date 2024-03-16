import Foundation

public protocol CancelLectureUseCase {
    func callAsFunction(lectureID: String) async throws
}
