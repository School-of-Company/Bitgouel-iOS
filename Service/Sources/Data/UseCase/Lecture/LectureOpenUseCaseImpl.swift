import Foundation

public struct LectureOpenUseCaseImpl: LectureOpenUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(req: LectureOpenRequestDTO) async throws {
        try await lectureRepository.lectureOpen(req: req)
    }
}
