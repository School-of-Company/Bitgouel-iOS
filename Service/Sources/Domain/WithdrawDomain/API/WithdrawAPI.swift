import Foundation
import Moya

public enum WithdrawAPI {
    case fetchWithdrawUserList(cohort: String)
}

extension WithdrawAPI: BitgouelAPI {
    public typealias ErrorType = WithdrawDomainError

    public var domain: BitgouelDomain {
        .withdraw
    }

    public var urlPath: String {
        switch self {
        case .fetchWithdrawUserList:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchWithdrawUserList:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchWithdrawUserList(cohort):
            return .requestParameters(parameters: [
                "cohort": cohort
            ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchWithdrawUserList:
            return .accessToken
        }
    }

    public var errorMap: [Int: WithdrawDomainError] {
        switch self {
        case .fetchWithdrawUserList:
            return [
                400: .internalServerError,
                401: .internalServerError,
                403: .forbidden,
                429: .internalServerError
            ]
        }
    }
}
