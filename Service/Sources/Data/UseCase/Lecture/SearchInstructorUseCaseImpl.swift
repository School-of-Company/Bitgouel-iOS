import Foundation

public struct SearchInstructorUseCaseImpl: SearchInstructorUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(keyword: String) async throws -> [InstructorInfoEntity] {
        try await lectureRepository.searchInstructor(keyword: keyword)
    }
}
