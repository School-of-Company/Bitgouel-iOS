import Foundation

public enum SchoolDomainError: Error {
    case internalServerError
}

extension SchoolDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .internalServerError:
            return "서버 에러입니다. 지속될 시 문의해 주세요."
        }
    }
}
