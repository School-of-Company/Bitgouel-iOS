import Foundation

public protocol FetchAppliedLectureStudentDetailUseCase {
    func callAsFunction(lectureID: String, studentID: String) async throws -> AppliedLectureStudentDetailEntity
}
