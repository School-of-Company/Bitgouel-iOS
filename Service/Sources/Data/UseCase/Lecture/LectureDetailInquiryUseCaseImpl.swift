import Foundation

struct LectureDetailInquiryUseCaseImpl: LectureDetailInquiryUseCase {
    private let lectureRepository: any LectureRepository
    
    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }
    
    func callAsFunction(userID: String) async throws {
        try await lectureRepository.lectureDetailInquiry(userID: userID)
    }
}
