import Foundation

public struct FetchLectureListUseCaseImpl: FetchLectureListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(type: String) async throws -> LectureContentEntity {
        try await lectureRepository.fetchLectureList(type: type)
    }
}
