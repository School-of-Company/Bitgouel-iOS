import Foundation
import Moya

public enum ActivityAPI {
    case inputActivity(req: InputActivityRequestDTO)
    case updateActibity(activityID: String, req: InputActivityRequestDTO)
    case deleteActivity(activityID: String)
    case fetchMyActivity
    case fetchActivityByID(studentID: String)
    case fetchActivityList
    case fetchActivityDetails(activityID: String)
}

extension ActivityAPI: BitgouelAPI {
    public typealias ErrorType = ActivityDomainError

    public var domain: BitgouelDomain {
        .activity
    }

    public var urlPath: String {
        switch self {
        case .inputActivity, .fetchActivityList:
            return ""
        case let .updateActibity(activityID, _),
             let .deleteActivity(activityID):
            return "/\(activityID)"
        case .fetchMyActivity:
            return "/my"
        case let .fetchActivityByID(studentID):
            return "/\(studentID)"
        case let .fetchActivityDetails(activityID):
            return "/\(activityID)/detail"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .inputActivity:
            return .post
        case .updateActibity:
            return .patch
        case .deleteActivity:
            return .delete
        case .fetchMyActivity,
             .fetchActivityByID,
             .fetchActivityList,
             .fetchActivityDetails:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .inputActivity(req),
             let .updateActibity(_, req):
            return .requestJSONEncodable(req)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .inputActivity,
             .updateActibity,
             .deleteActivity,
             .fetchActivityDetails:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]
        case .fetchMyActivity,
             .fetchActivityByID,
             .fetchActivityList:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
