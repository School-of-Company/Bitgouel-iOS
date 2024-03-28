import Foundation

public struct InquiryAnswerRequestDTO: Encodable {
    public let answer: String

    public init(answer: String) {
        self.answer = answer
    }
}
