import Foundation
import Moya

public enum UserAPI {
    case changePassword(ChangePasswordRequestDTO)
    case queryMyInfo
}

extension UserAPI: BitgouelAPI {
    public typealias ErrorType = UserDomainError
    
    public var domain: BitgouelDomain {
        .user
    }
    
    public var urlPath: String {
        switch self {
        case .changePassword, .queryMyInfo:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .changePassword:
            return .patch
        case .queryMyInfo:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case let .changePassword(req):
            return .requestJSONEncodable(req)
        case .queryMyInfo:
            return .requestPlain
        }
    }
    
    public var jwtTokenType: JwtTokenType {
        switch self {
        case .changePassword, .queryMyInfo:
            return .accessToken
        }
    }
    
    public var errorMap: [Int : UserDomainError] {
        switch self {
        case .changePassword:
            return [
                400: .badRequest,
                401: .unauthorized,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]
        case .queryMyInfo:
            return [
                400: .badRequest,
                401: .unauthorized,
                404: .notFound
            ]
        }
    }
}
