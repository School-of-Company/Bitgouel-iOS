import Foundation

public struct SearchDivisionUseCaseImpl: SearchDivisionUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String) async throws -> [String] {
        try await lectureRepository.searchDivision(keyword: keyword)
    }
}
