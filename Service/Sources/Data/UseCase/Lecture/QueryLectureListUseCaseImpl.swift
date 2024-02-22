import Foundation

public struct QueryLectureListUseCaseImpl: QueryLectureListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction() async throws -> [LectureListEntity] {
        try await lectureRepository.queryLectureList()
    }
}
