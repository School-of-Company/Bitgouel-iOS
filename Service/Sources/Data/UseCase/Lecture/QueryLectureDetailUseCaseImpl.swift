import Foundation

public struct QueryLectureDetailUseCaseImpl: QueryLectureDetailUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(userID: String) async throws -> LectureDetailEntity {
        try await lectureRepository.queryLectureDetail(userID: userID)
    }
}
