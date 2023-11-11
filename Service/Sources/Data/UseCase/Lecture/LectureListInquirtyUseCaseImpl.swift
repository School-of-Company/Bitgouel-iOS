import Foundation

struct LectureListInquirtyUseCaseImpl: LectureListInquirtyUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction() async throws {
        try await lectureRepository.lectureListInquiry()
    }
}
