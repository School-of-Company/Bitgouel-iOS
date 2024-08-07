import Foundation

public struct SearchDepartmentUseCaseImpl: SearchDepartmentUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String) async throws -> [String] {
        try await lectureRepository.searchDepartment(keyword: keyword)
    }
}
