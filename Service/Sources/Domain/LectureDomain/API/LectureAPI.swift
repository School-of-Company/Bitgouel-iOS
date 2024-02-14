import Foundation
import Moya

public enum LectureAPI {
    case lectureOpen(LectureOpenRequestDTO)
    case queryLectureList
    case queryLectureDetail(userID: String)
    case lectureApply(userID: String)
    case waitingLectureApprove(userID: String)
    case waitingLectureReject(userID: String)
}

extension LectureAPI: BitgouelAPI {
    public typealias ErrorType = LectureDomainError

    public var domain: BitgouelDomain {
        .lecture
    }

    public var urlPath: String {
        switch self {
        case .lectureOpen, .queryLectureList:
            return ""

        case let .queryLectureDetail(userID):
            return "/\(userID)"

        case let .lectureApply(userID):
            return "/\(userID)"

        case let .waitingLectureApprove(userID):
            return "/\(userID)/approve"

        case let .waitingLectureReject(userID: userID):
            return "/\(userID)/reject"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .lectureOpen, .lectureApply:
            return .post

        case .queryLectureList, .queryLectureDetail:
            return .get

        case .waitingLectureApprove:
            return .patch

        case .waitingLectureReject:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .lectureOpen(req):
            return .requestJSONEncodable(req)

        case .queryLectureList:
            return .requestParameters(parameters: [
                "page" : Int(),
                "size" : Int(),
                "statuse" : ApproveStatusType.self,
                "type" : LectureType.self
            ], encoding: URLEncoding.queryString)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .lectureOpen,
             .queryLectureList,
             .queryLectureDetail,
             .lectureApply,
             .waitingLectureApprove,
             .waitingLectureReject:
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

        case .queryLectureList:
            return [
                400: .badRequest,
                401: .unauthorized,
                403 : .forbidden,
                404 : .notFound
            ]

        case .queryLectureDetail:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound
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

        case .waitingLectureApprove:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]

        case .waitingLectureReject:
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
