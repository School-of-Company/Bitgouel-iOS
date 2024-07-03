import Foundation

public struct DeleteLectureUseCaseImpl: DeleteLectureUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String) async throws {
        try await lectureRepository.deleteLecture(lectureID: lectureID)
    }
}
