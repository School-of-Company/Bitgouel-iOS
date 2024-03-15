import Foundation

public struct SearchDivisionListUseCaseImpl: SearchDivisionListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }
    
    public func callAsFunction(keyword: String, division: String) async throws -> DivisionListEntity {
        try await lectureRepository.fetchDivisionList(keyword: keyword, division: division)
    }
}
