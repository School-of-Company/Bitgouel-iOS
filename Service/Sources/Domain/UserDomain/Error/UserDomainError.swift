import Foundation

public enum UserDomainError: Error {
    case unauthorized
    case conflict
}

extension UserDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "비밀번호가 일치하지 않습니다."

        case .conflict:
            return "기존 비밀번호와 새 비밀번호가 일치합니다."
        }
    }
}
