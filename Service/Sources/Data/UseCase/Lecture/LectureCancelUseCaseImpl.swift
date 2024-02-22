import Foundation

public struct LectureCancelUseCaseImpl: LectureCancelUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await lectureRepository.lectureCancel(userID: userID)
    }
}
