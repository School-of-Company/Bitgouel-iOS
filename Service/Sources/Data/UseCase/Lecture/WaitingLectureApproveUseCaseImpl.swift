import Foundation

struct WaitingLectureApproveUseCaseImpl: WaitingLectureUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(userID: String) async throws {
        try await lectureRepository.waitingLectureApprove(userID: userID)
    }
}
