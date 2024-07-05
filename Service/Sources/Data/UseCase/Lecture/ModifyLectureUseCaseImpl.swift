import Foundation

public struct ModifyLectureUseCaseImpl: ModifyLectureUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String, req: InputLectureRequestDTO) async throws {
        try await lectureRepository.modifyLecture(lectureID: lectureID, req: req)
    }
}
