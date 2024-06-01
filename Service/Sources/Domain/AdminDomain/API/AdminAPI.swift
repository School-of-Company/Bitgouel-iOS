import Foundation
import Moya

public enum AdminAPI {
    case fetchUserList(keyword: String, authority: String, approveStatus: String)
    case fetchUserDetail(userID: String)
    case approveUserSignup(userID: String)
    case rejectUserSignup(userID: String)
    case withdrawUserSignup(userID: String)
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

        case .withdrawUserSignup:
            return "/withdraw"

        case .rejectUserSignup:
            return "/reject"
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

        case let .approveUserSignup(userID),
             let .rejectUserSignup(userID),
             let .withdrawUserSignup(userID):
            return .requestParameters(parameters: [
                "userIds": userID
            ], encoding: URLEncoding.queryString)

        case .fetchUserDetail:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int: AdminDomainError] {
        switch self {
        default:
            return [
                400: .badRequest,
                409: .conflict,
                500: .internalServerError
            ]
        }
    }
}
