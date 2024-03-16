import Foundation

public struct FetchFAQDetailResponseDTO: Decodable {
    public let questionID: String
    public let question: String
    public let answer: String

    public init(
        questionID: String,
        question: String,
        answer: String
    ) {
        self.questionID = questionID
        self.question = question
        self.answer = answer
    }

    enum CodingKeys: String, CodingKey {
        case questionID = "id"
        case question
        case answer
    }
}

extension FetchFAQDetailResponseDTO {
    func toDomain() -> FAQDetailInfoEntity {
        FAQDetailInfoEntity(
            questionID: questionID,
            question: question,
            answer: answer
        )
    }
}
