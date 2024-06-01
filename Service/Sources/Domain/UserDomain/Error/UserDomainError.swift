import Foundation

public enum UserDomainError: Error {
    case unauthorized
}

extension UserDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "비밀번호가 일치하지 않습니다."
        }
    }
}
