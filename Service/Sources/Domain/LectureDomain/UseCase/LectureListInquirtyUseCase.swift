import Foundation

public protocol QueryLectureListUseCase {
    func callAsFunction() async throws -> [LectureListEntity]
}
