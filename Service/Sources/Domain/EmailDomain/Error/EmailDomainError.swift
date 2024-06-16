import Foundation

public enum EmailDomainError: Error {
    case notFound
}

extension EmailDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "이메일로 가입된 유저를 찾을 수 없습니다."
        }
    }
}
