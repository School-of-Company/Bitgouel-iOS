import Foundation

public struct FetchFAQListResponseDTO: Decodable {
    public let faqList: [FAQInfo]
    
    public init(faqList: [FAQInfo]) {
        self.faqList = faqList
    }
    
    public struct FAQInfo: Decodable {
        public let questionID: String
        public let question: String
        
        public init(
            questionID: String,
            question: String
        ) {
            self.questionID = questionID
            self.question = question
        }
        
        public enum CodingKeys: String, CodingKey {
            case questionID = "id"
            case question
        }
    }
}

extension FetchFAQListResponseDTO {
    func toDomain() -> [FAQInfoEntity] {
        faqList.map { $0.toDomain() }
    }
}

extension FetchFAQListResponseDTO.FAQInfo {
    func toDomain() -> FAQInfoEntity {
        FAQInfoEntity(
            questionID: questionID,
            question: question
        )
    }
}
