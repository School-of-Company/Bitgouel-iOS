import Foundation

struct WaitingLectureRejectUseCaseImpl: WaitingLectureRejectUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(userID: String) async throws {
        try await lectureRepository.waitingLectureReject(userID: userID)
    }
}
