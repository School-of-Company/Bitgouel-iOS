import Foundation

public protocol FetchAppliedLectureListUseCase {
    func callAsFunction(studentID: String) async throws -> [AppliedLectureEntity]
}
