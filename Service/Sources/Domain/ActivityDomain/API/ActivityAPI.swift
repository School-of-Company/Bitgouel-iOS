import Foundation
import Moya

public enum ActivityAPI {
    case addStudentActivity(AddStudentActivityRequestDTO)
    case updateStudentActibity(userID: String)
    case approveStudentActivity(userID: String)
    case rejectStudentActivity(userID: String)
    case deleteStudentActivity(userID: String)
    case queryMyStudentActivity
    case queryStudentActivityById(studentID: String)
    case queryStudentActivityList
    case queryStudentActivityDetails(userID: String)
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
        case let .queryStudentActivityById(studentID):
            return "/\(studentID)"
        case let .queryStudentActivityDetails(userID):
            return "/\(userID)/detail"
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
             .queryStudentActivityById,
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
        case .addStudentActivity,
             .updateStudentActibity,
             .approveStudentActivity,
             .rejectStudentActivity,
             .deleteStudentActivity,
             .queryMyStudentActivity,
             .queryStudentActivityById,
             .queryStudentActivityList,
             .queryStudentActivityDetails:
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
             .queryStudentActivityById,
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
