import Foundation
import Moya

public enum LectureAPI {
    case lectureOpen(LectureOpenRequestDTO)
    case lectureApply(userID: String)
}

extension LectureAPI: BitgouelAPI {
    public typealias ErrorType = LectureDomainError

    public var domain: BitgouelDomain {
        .lecture
    }

    public var urlPath: String {
        switch self {
        case .lectureOpen:
            return ""

        case let .lectureApply(userID):
            return "/\(userID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .lectureOpen, .lectureApply:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .lectureOpen(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .lectureOpen, .lectureApply:
            return .accessToken
        }
    }

    public var errorMap: [Int : LectureDomainError] {
        switch self {
        case .lectureOpen:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                409: .conflict
            ]

        case .lectureApply:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]
        }
    }
}
