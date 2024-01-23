import Foundation

public struct WaitingLectureRejectUseCaseImpl: WaitingLectureRejectUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await lectureRepository.waitingLectureReject(userID: userID)
    }
}
