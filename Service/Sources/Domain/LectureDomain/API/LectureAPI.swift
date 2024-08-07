import Foundation
import Moya

public enum LectureAPI {
    case openLecture(req: InputLectureRequestDTO)
    case fetchLectureList(type: String)
    case fetchLectureDetail(lectureID: String)
    case applyLecture(lectureID: String)
    case cancelLectureApplication(lectureID: String)
    case searchInstructor(keyword: String)
    case searchLine(keyword: String, division: String)
    case searchDepartment(keyword: String)
    case searchDivision(keyword: String)
    case fetchAppliedLectureList(studentID: String)
    case fetchApplicantList(lectureID: String)
    case setLectureCompletion(lectureID: String, students: [String])
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
             let .cancelLectureApplication(lectureID),
             let .modifyLecture(lectureID, _):
            return "/\(lectureID)"

        case .searchInstructor:
            return "/instructor"

        case .searchLine:
            return "/line"

        case .searchDepartment:
            return "/department"

        case .searchDivision:
            return "/division"

        case let .fetchAppliedLectureList(studentID):
            return "/\(studentID)/signup"

        case let .fetchApplicantList(lectureID):
            return "/student/\(lectureID)"

        case let .setLectureCompletion(lectureID, _):
            return "/\(lectureID)/complete"

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
             .searchInstructor,
             .searchLine,
             .searchDepartment,
             .searchDivision,
             .fetchAppliedLectureList,
             .fetchApplicantList:
            return .get

        case .cancelLectureApplication,
             .deleteLecture:
            return .delete

        case .setLectureCompletion,
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

        case let .searchInstructor(keyword),
             let .searchDepartment(keyword),
             let .searchDivision(keyword):
            return .requestParameters(parameters: [
                "keyword": keyword
            ], encoding: URLEncoding.queryString)

        case let .searchLine(keyword, division):
            return .requestParameters(parameters: [
                "keyword": keyword,
                "division": division
            ], encoding: URLEncoding.queryString)

        case let .setLectureCompletion(_, students):
            return .requestParameters(parameters: [
                "studentIds": students
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
