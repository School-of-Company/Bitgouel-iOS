import Foundation

public struct SearchDivisionListUseCaseImpl: SearchLineListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String, line: String) async throws -> [String] {
        try await lectureRepository.fetchLineList(keyword: keyword, line: line)
    }
}
