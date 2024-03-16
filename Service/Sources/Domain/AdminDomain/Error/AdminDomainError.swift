import Foundation

public enum AdminDomainError: Error {
    case forbidden
    case conflict
    case internalServerError
}

extension AdminDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."
        case .conflict:
            return "이미 완료된 유저입니다."
        case .internalServerError:
            return "알 수 없는 에러가 발생했습니다. 지속될 시 문의 주세요."
        }
    }
}
