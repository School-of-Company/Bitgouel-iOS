import Foundation

public struct ModifyApplicantWhetherUseCaseImpl: ModifyApplicantWhetherUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String, studentID: String, isComplete: Bool) async throws {
        try await lectureRepository.modifyApplicantWhether(
            lectureID: lectureID,
            studentID: studentID,
            isComplete: isComplete
        )
    }
}
