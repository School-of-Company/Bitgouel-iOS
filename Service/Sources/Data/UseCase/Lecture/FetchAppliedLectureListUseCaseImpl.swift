import Foundation

public struct FetchAppliedLectureListUseCaseImpl: FetchAppliedLectureListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(studentID: String) async throws -> [AppliedLectureEntity] {
        try await lectureRepository.fetchAppliedLectureList(studentID: studentID)
    }
}
