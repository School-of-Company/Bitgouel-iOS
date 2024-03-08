import Foundation
import Moya

public enum AdminAPI {
    case fetchUserList(keyword: String, authority: String, approveStatus: String)
    case fetchUserDetail(userID: String)
    case approveUserSignup(userID: [String])
    case rejectUserSignup(userID: [String])
    case withdrawUserSignup(userID: [String])
}

extension AdminAPI: BitgouelAPI {
    public typealias ErrorType = AdminDomainError

    public var domain: BitgouelDomain {
        .admin
    }

    public var urlPath: String {
        switch self {
        case .fetchUserList,
             .approveUserSignup:
            return ""

        case let .fetchUserDetail(userID):
            return "/\(userID)"

        case let .withdrawUserSignup(userID):
            return "/\(userID)"

        case let .rejectUserSignup(userID):
            return "/\(userID)/reject"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchUserList,
             .fetchUserDetail:
            return .get

        case .approveUserSignup:
            return .patch

        case .rejectUserSignup,
             .withdrawUserSignup:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchUserList(keyword, authority, approveStatus):
            return .requestParameters(parameters: [
                "keyword": keyword,
                "authority": authority,
                "approveStatus": approveStatus
            ], encoding: URLEncoding.queryString)

        case .fetchUserDetail,
             .approveUserSignup,
             .rejectUserSignup,
             .withdrawUserSignup:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int : AdminDomainError] {
        switch self {
        case .fetchUserList:
            return [
                400: .internalServerError,
                401: .internalServerError,
                403: .forbidden,
                429: .internalServerError
            ]

        case .fetchUserDetail:
            return [
                400: .internalServerError,
                401: .internalServerError,
                403: .forbidden,
                404: .internalServerError,
                429: .internalServerError
            ]

        case .approveUserSignup,
             .rejectUserSignup,
             .withdrawUserSignup:
            return [
                400: .internalServerError,
                401: .internalServerError,
                403: .forbidden,
                404: .internalServerError,
                409: .conflict,
                429: .internalServerError
            ]
        }
    }
}
