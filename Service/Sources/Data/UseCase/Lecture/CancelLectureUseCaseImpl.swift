import Foundation

public struct CancelLectureUseCaseImpl: CancelLectureUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String) async throws {
        try await lectureRepository.cancelLecture(lectureID: lectureID)
    }
}
