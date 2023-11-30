import Foundation
import Moya

public enum ActivityAPI {
    case addStudentActivity(AddStudentActivityRequestDTO)
    case updateStudentActibity(userID: String)
    case approveStudentActivity(userID: String)
    case rejectStudentActivity(userID: String)
    case deleteStudentActivity(userID: String)
    case queryMyStudentActivity
}

extension ActivityAPI: BitgouelAPI {
    public typealias ErrorType = ActivityDomainError

    public var domain: BitgouelDomain {
        .activity
    }

    public var urlPath: String {
        switch self {
        case .addStudentActivity:
            return ""
        case let .updateStudentActibity(userID):
            return "/\(userID)"
        case let .approveStudentActivity(userID):
            return "/\(userID)/approve"
        case let .rejectStudentActivity(userID):
            return "/\(userID)/reject"
        case let .deleteStudentActivity(userID):
            return "/\(userID)"
        case .queryMyStudentActivity:
            return "/my"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .addStudentActivity:
            return .post
        case .updateStudentActibity, .approveStudentActivity:
            return .patch
        case .rejectStudentActivity, .deleteStudentActivity:
            return .delete
        case .queryMyStudentActivity:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .addStudentActivity(req):
            return .requestJSONEncodable(req)
        case .updateStudentActibity:
            return .requestParameters(parameters: [
                "title": String(),
                "content": String(),
                "credit": Int(),
                "activity": String()
            ], encoding: URLEncoding.httpBody)
        case .queryMyStudentActivity:
            return .requestParameters(parameters: [
                "page": Int(),
                "size": Int(),
                "sort": String()
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .addStudentActivity, .updateStudentActibity, .approveStudentActivity, .rejectStudentActivity,
                .deleteStudentActivity, .queryMyStudentActivity:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .addStudentActivity, .updateStudentActibity, .rejectStudentActivity, .deleteStudentActivity:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]
        case .approveStudentActivity, .queryMyStudentActivity:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                407: .proxyAuthenticationRequired,
                408: .requestTimeout,
                409: .conflict,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
