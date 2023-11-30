import Foundation
import Moya

public enum ActivityAPI {
    case addStudentActivity(AddStudentActivityRequestDTO)
    case updateStudentActibity(userID: String)
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
        }
    }

    public var method: Moya.Method {
        switch self {
        case .addStudentActivity:
            return .post
        case .updateStudentActibity:
            return .patch
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
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .addStudentActivity, .updateStudentActibity:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .addStudentActivity, .updateStudentActibity:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                423: .tooManyRequest
            ]
        }
    }
}
