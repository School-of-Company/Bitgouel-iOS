import Foundation

public enum ActivityDomainError: Error {
    case forbidden
    case notFound
}

extension ActivityDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."
        }
    }
}
