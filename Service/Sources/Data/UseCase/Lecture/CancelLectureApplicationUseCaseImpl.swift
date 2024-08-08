import Foundation

public struct CancelLectureApplicationUseCaseImpl: CancelLectureApplicationUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String) async throws {
        try await lectureRepository.cancelLectureApplication(lectureID: lectureID)
    }
}
