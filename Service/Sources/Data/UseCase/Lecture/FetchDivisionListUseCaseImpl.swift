import Foundation

public struct FetchDivisionListUseCaseImpl: FetchDivisionListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String) async throws -> [String] {
        try await lectureRepository.fetchDivisionList(keyword: keyword)
    }
}
