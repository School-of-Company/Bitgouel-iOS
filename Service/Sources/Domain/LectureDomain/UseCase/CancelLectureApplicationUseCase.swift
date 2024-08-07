import Foundation

public protocol CancelLectureApplicationUseCase {
    func callAsFunction(lectureID: String) async throws
}
