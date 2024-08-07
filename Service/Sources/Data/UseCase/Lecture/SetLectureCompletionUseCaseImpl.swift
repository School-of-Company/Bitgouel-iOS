import Foundation

public struct SetLectureCompletionUseCaseImpl: SetLectureCompletionUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String, students: [String]) async throws {
        try await lectureRepository.setLectureCompletion(lectureID: lectureID, students: students)
    }
}
