import Foundation

public enum FAQDomainError: Error {
    case notFound
}

extension FAQDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "존재하지 않는 어드민입니다."
        }
    }
}
