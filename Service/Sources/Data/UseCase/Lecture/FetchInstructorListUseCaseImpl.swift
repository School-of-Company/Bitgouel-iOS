import Foundation

public struct FetchInstructorListUseCaseImpl: FetchInstructorListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String) async throws -> [InstructorInfoEntity] {
        try await lectureRepository.fetchInstructorList(keyword: keyword)
    }
}
