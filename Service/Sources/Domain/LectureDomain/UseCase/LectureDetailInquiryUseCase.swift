import Foundation

public protocol LectureDetailInquiryUseCase {
    func callAsFunction(userID: String) async throws
}
