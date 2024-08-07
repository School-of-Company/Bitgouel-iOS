import Foundation

public struct FetchAppliedLectureStudentDetailUseCaseImpl: FetchAppliedLectureStudentDetailUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String, studentID: String) async throws -> AppliedLectureStudentDetailEntity {
        try await lectureRepository.fetchAppliedLectureStudentDetail(lectureID: lectureID, studentID: studentID)
    }
}
