import Foundation

public struct FetchLineListUseCaseImpl: FetchLineListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String, division: String) async throws -> [String] {
        try await lectureRepository.fetchLineList(keyword: keyword, division: division)
    }
}
