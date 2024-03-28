import Foundation

public struct FetchFAQListResponseDTO: Decodable {
    public let faqs: [FAQInfoResponseDTO]

    public init(faqs: [FAQInfoResponseDTO]) {
        self.faqs = faqs
    }
}

public struct FAQInfoResponseDTO: Decodable {
    public let questionID: Int
    public let question: String
    public let answer: String

    public init(
        questionID: Int,
        question: String,
        answer: String
    ) {
        self.questionID = questionID
        self.question = question
        self.answer = answer
    }

    public enum CodingKeys: String, CodingKey {
        case questionID = "id"
        case question
        case answer
    }
}

extension FetchFAQListResponseDTO {
    func toDomain() -> [FAQInfoEntity] {
        faqs.map { $0.toDomain() }
    }
}

extension FAQInfoResponseDTO {
    func toDomain() -> FAQInfoEntity {
        FAQInfoEntity(
            questionID: questionID,
            question: question,
            answer: answer
        )
    }
}
