import Foundation

public struct FetchLectureDetailUseCaseImpl: FetchLectureDetailUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String) async throws -> LectureDetailEntity {
        try await lectureRepository.fetchLectureDetail(lectureID: lectureID)
    }
}
