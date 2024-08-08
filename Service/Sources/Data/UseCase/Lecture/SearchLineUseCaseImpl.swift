import Foundation

public struct SearchLineUseCaseImpl: SearchLineUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String, division: String) async throws -> [String] {
        try await lectureRepository.searchLine(keyword: keyword, division: division)
    }
}
