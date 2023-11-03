import Foundation

public struct LectureApplyUseCaseImpl: LectureApplyUseCase {
    private let lectureRepository: any LectureRepository
    
    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }
    
    public func callAsFunction(userID: String) async throws {
        try await lectureRepository.lectureApply(userID: userID)
    }
}
