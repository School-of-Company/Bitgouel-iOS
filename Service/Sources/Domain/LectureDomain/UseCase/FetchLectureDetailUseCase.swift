import Foundation

public protocol FetchLectureDetailUseCase {
    func callAsFunction(lectureID: String) async throws -> LectureDetailEntity
}
