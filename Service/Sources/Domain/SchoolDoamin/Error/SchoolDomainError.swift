import Foundation

public enum SchoolDomainError: Error {
    case badRequest
    case notFound
    case conflict
}

extension SchoolDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest: return "유효하지 않은 확장자입니다."
        case .notFound: return "존재하지 않는 학교입니다."
        case .conflict: return "이미 존재하는 학교입니다."
        }
    }
}
