import Foundation

public struct LectureListInquirtyUseCaseImpl: LectureListInquirtyUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction() async throws {
        try await lectureRepository.lectureListInquiry()
    }
}
