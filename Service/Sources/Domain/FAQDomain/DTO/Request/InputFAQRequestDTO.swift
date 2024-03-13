import Foundation

public struct InputFAQRequestDTO: Encodable {
    public let question: String
    public let answer: String

    public init(
        question: String,
        answer: String
    ) {
        self.question = question
        self.answer = answer
    }
}
