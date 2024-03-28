import Foundation
import Moya

public enum LectureAPI {
    case openLecture(req: OpenLectureRequestDTO)
    case fetchLectureList(type: String)
    case fetchLectureDetail(lectureID: String)
    case applyLecture(lectureID: String)
    case cancelLecture(lectureID: String)
    case fetchInstructorList(keyword: String)
    case fetchDivisionList(keyword: String, division: String)
    case fetchDepartmentList(keyword: String)
}

extension LectureAPI: BitgouelAPI {
    public typealias ErrorType = LectureDomainError

    public var domain: BitgouelDomain {
        .lecture
    }

    public var urlPath: String {
        switch self {
        case .openLecture,
             .fetchLectureList:
            return ""

        case let .fetchLectureDetail(lectureID),
             let .applyLecture(lectureID),
             let .cancelLecture(lectureID):
            return "/\(lectureID)"

        case .fetchInstructorList:
            return "/instructor"

        case .fetchDivisionList:
            return "/line"

        case .fetchDepartmentList:
            return "/department"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .openLecture,
             .applyLecture:
            return .post

        case .fetchLectureList,
             .fetchLectureDetail,
             .fetchInstructorList,
             .fetchDivisionList,
             .fetchDepartmentList:
            return .get

        case .cancelLecture:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .openLecture(req):
            return .requestJSONEncodable(req)

        case let .fetchLectureList(type):
            return .requestParameters(parameters: [
                "type": type
            ], encoding: URLEncoding.queryString)

        case let .fetchInstructorList(keyword),
             let .fetchDepartmentList(keyword):
            return .requestParameters(parameters: [
                "keyword": keyword
            ], encoding: URLEncoding.queryString)

        case let .fetchDivisionList(keyword, division):
            return .requestParameters(parameters: [
                "keyword": keyword,
                "division": division
            ], encoding: URLEncoding.queryString)

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

    public var errorMap: [Int: LectureDomainError] {
        switch self {
        case .openLecture:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                409: .conflict
            ]

        case .fetchLectureList,
             .fetchInstructorList,
             .fetchDivisionList,
             .fetchDepartmentList:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden
            ]

        case .fetchLectureDetail:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound
            ]

        case .applyLecture,
             .cancelLecture:
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
