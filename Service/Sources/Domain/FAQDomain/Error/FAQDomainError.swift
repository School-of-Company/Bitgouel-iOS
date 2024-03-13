import Foundation

public enum FAQDomainError: Error {
    case forbidden
    case conflict
    case internalServerError
}

extension FAQDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."
        case .conflict:
            return "이미 작성되어있는 질문입니다."
        case .internalServerError:
            return "알 수 없는 에러가 발생했습니다. 지속될 시 문의 주세요."
        }
    }
}
