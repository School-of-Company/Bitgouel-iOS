import Foundation

public enum GovernmentDomainError: Error {
    case notFound
    case conflict
}

extension GovernmentDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound: return "존재하지 않는 유관기관입니다."
        case .conflict: return "이미 존재하는 유관기관입니다."
        }
    }
}
