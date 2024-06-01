import Foundation
import Moya

public enum UserAPI {
    case changePassword(ChangePasswordRequestDTO)
    case fetchMyInfo
}

extension UserAPI: BitgouelAPI {
    public typealias ErrorType = UserDomainError

    public var domain: BitgouelDomain {
        .user
    }

    public var urlPath: String {
        switch self {
        case .changePassword,
             .fetchMyInfo:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .changePassword:
            return .patch
        case .fetchMyInfo:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .changePassword(req):
            return .requestJSONEncodable(req)
        case .fetchMyInfo:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .changePassword,
             .fetchMyInfo:
            return .accessToken
        }
    }

    public var errorMap: [Int: UserDomainError] {
        switch self {
        default:
            return [
                401: .unauthorized
            ]
        }
    }
}
