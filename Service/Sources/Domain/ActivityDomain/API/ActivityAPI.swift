import Foundation
import Moya

public enum ActivityAPI {
    case addStudentActivity(AddStudentActivityRequestDTO)
    case updateStudentActibity(activityID: String)
    case approveStudentActivity(activityID: String)
    case rejectStudentActivity(activityID: String)
    case deleteStudentActivity(activityID: String)
    case queryMyStudentActivity
    case queryStudentActivityByID(studentID: String)
    case queryStudentActivityList
    case queryStudentActivityDetails(activityID: String)
}

extension ActivityAPI: BitgouelAPI {
    public typealias ErrorType = ActivityDomainError

    public var domain: BitgouelDomain {
        .activity
    }

    public var urlPath: String {
        switch self {
        case .addStudentActivity, .queryStudentActivityList:
            return ""
        case let .updateStudentActibity(activityID):
            return "/\(activityID)"
        case let .approveStudentActivity(activityID):
            return "/\(activityID)/approve"
        case let .rejectStudentActivity(activityID):
            return "/\(activityID)/reject"
        case let .deleteStudentActivity(activityID):
            return "/\(activityID)"
        case .queryMyStudentActivity:
            return "/my"
        case let .queryStudentActivityByID(studentID):
            return "/\(studentID)"
        case let .queryStudentActivityDetails(activityID):
            return "/\(activityID)/detail"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .addStudentActivity:
            return .post
        case .updateStudentActibity,
             .approveStudentActivity:
            return .patch
        case .rejectStudentActivity,
             .deleteStudentActivity:
            return .delete
        case .queryMyStudentActivity,
             .queryStudentActivityByID,
             .queryStudentActivityList,
             .queryStudentActivityDetails:
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
        case .addStudentActivity,
             .updateStudentActibity,
             .rejectStudentActivity,
             .deleteStudentActivity,
             .queryStudentActivityDetails:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]
        case .approveStudentActivity,
             .queryMyStudentActivity,
             .queryStudentActivityByID,
             .queryStudentActivityList:
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
