import Foundation

public struct OpenLectureUseCaseImpl: OpenLectureUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(req: InputLectureRequestDTO) async throws {
        try await lectureRepository.openLecture(req: req)
    }
}
