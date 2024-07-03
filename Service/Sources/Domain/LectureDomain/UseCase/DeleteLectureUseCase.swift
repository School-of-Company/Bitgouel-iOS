import Foundation

public protocol DeleteLectureUseCase {
    func callAsFunction(lectureID: String) async throws
}
