import Foundation

public enum InquiryDomainError: Error {
    case forbidden
    case notFound
    case conflict
}

extension InquiryDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "존재하지 않는 문의사항입니다."

        case .conflict:
            return "이미 답변이 등록된 문의사항입니다."
        }
    }
}
