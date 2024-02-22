import Foundation

public struct LectureCancleUseCaseImpl: LectureCancleUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await lectureRepository.lectureCancle(userID: userID)
    }
}
