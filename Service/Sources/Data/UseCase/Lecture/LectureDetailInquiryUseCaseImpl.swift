import Foundation

public struct LectureDetailInquiryUseCaseImpl: LectureDetailInquiryUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await lectureRepository.lectureDetailInquiry(userID: userID)
    }
}
