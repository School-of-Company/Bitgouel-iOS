import Foundation

public protocol FetchLectureListUseCase {
    func callAsFunction(type: String) async throws -> LectureContentEntity
}
