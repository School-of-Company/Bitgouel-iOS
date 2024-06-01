import Foundation
import Moya

public enum ActivityAPI {
    case inputActivity(req: InputActivityRequestDTO)
    case modifyActivity(activityID: String, req: InputActivityRequestDTO)
    case deleteActivity(activityID: String)
    case fetchMyActivity
    case fetchActivityByID(studentID: String)
    case fetchActivityList
    case fetchActivityDetail(activityID: String)
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
        case let .modifyActivity(activityID, _),
             let .deleteActivity(activityID):
            return "/\(activityID)"
        case .fetchMyActivity:
            return "/my"
        case let .fetchActivityByID(studentID):
            return "/\(studentID)"
        case let .fetchActivityDetail(activityID):
            return "/\(activityID)/detail"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .inputActivity:
            return .post
        case .modifyActivity:
            return .patch
        case .deleteActivity:
            return .delete
        case .fetchMyActivity,
             .fetchActivityByID,
             .fetchActivityList,
             .fetchActivityDetail:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .inputActivity(req),
             let .modifyActivity(_, req):
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
        default:
            return [
                403: .forbidden,
                404: .notFound
            ]
        }
    }
}
