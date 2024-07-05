import Foundation
import Moya

public enum LectureAPI {
    case openLecture(req: InputLectureRequestDTO)
    case fetchLectureList(type: String)
    case fetchLectureDetail(lectureID: String)
    case applyLecture(lectureID: String)
    case cancelLecture(lectureID: String)
    case fetchInstructorList(keyword: String)
    case fetchLineList(keyword: String, division: String)
    case fetchDepartmentList(keyword: String)
    case fetchDivisionList(keyword: String)
    case fetchAppliedLectureList(studentID: String)
    case fetchApplicantList(lectureID: String)
    case modifyApplicantWhether(lectureID: String, studentID: String, isComplete: Bool)
    case deleteLecture(lectureID: String)
    case modifyLecture(lectureID: String, req: InputLectureRequestDTO)
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
             let .cancelLecture(lectureID),
             let .modifyLecture(lectureID, _):
            return "/\(lectureID)"

        case .fetchInstructorList:
            return "/instructor"

        case .fetchLineList:
            return "/line"

        case .fetchDepartmentList:
            return "/department"

        case .fetchDivisionList:
            return "/division"

        case let .fetchAppliedLectureList(studentID):
            return "/\(studentID)/signup"

        case let .fetchApplicantList(lectureID):
            return "/student/\(lectureID)"

        case let .modifyApplicantWhether(lectureID, studentID, _):
            return "/\(lectureID)/\(studentID)"

        case let .deleteLecture(lectureID):
            return "/\(lectureID)/soft"
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
             .fetchLineList,
             .fetchDepartmentList,
             .fetchDivisionList,
             .fetchAppliedLectureList,
             .fetchApplicantList:
            return .get

        case .cancelLecture,
             .deleteLecture:
            return .delete

        case .modifyApplicantWhether,
             .modifyLecture:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .openLecture(req),
             let .modifyLecture(_, req):
            return .requestJSONEncodable(req)

        case let .fetchLectureList(type):
            return .requestParameters(parameters: [
                "type": type
            ], encoding: URLEncoding.queryString)

        case let .fetchInstructorList(keyword),
             let .fetchDepartmentList(keyword),
             let .fetchDivisionList(keyword):
            return .requestParameters(parameters: [
                "keyword": keyword
            ], encoding: URLEncoding.queryString)

        case let .fetchLineList(keyword, division):
            return .requestParameters(parameters: [
                "keyword": keyword,
                "division": division
            ], encoding: URLEncoding.queryString)

        case let .modifyApplicantWhether(_, _, isComplete):
            return .requestParameters(parameters: [
                "isComplete": isComplete
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
        default:
            return [
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
