import Foundation

public struct FAQInfoEntity: Equatable {
    public let questionID: String
    public let question: String

    public init(
        questionID: String,
        question: String
    ) {
        self.questionID = questionID
        self.question = question
    }
}
