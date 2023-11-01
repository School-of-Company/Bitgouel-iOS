import Foundation

struct LectureOpenUseCaseImpl: LectureOpenUseCase {
    private let lectureRepository: any LectureRepository
    
    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }
    
    public func callAsFunction(req: LectureOpenRequestDTO) async throws {
        try await lectureRepository.lectureOpen(req: req)
    }
}
