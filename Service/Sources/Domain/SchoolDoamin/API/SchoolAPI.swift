import Foundation
import Moya

public enum SchoolAPI {
    case fetchSchoolList
    case fetchAllSchoolName
    case createdSchool(logoImage: Data, req: InputSchoolInfoRequestDTO)
    case modifySchool(schoolID: Int, logoImage: Data, req: InputSchoolInfoRequestDTO)
    case deleteSchool(schoolID: Int)
}

extension SchoolAPI: BitgouelAPI {
    public typealias ErrorType = SchoolDomainError

    public var domain: BitgouelDomain {
        .school
    }

    public var urlPath: String {
        switch self {
        case .fetchSchoolList,
             .createdSchool:
            return ""

        case .fetchAllSchoolName:
            return "/name"

        case let .modifySchool(schoolID, _, _),
             let .deleteSchool(schoolID):
            return "/\(schoolID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchSchoolList,
             .fetchAllSchoolName:
            return .get

        case .createdSchool:
            return .post

        case .modifySchool:
            return .patch

        case .deleteSchool:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchSchoolList,
             .fetchAllSchoolName,
             .deleteSchool:
            return .requestPlain

        case let .createdSchool(logoImage, req),
             let .modifySchool(_, logoImage, req):
            let imageData = MultipartFormData(provider: .data(logoImage), name: "logoImage")
            let params: [String: Any] = [
                "name": req.schoolName,
                "line": req.line,
                "departments": req.departments
            ]
            guard let jsonData = try? JSONSerialization.data(withJSONObject: params, options: []) else {
                return .requestPlain
            }
            let jsonPart = MultipartFormData(
                provider: .data(jsonData),
                name: "webRequest",
                mimeType: "application/json"
            )

            return .uploadMultipart([jsonPart, imageData])
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchSchoolList,
             .createdSchool,
             .modifySchool,
             .deleteSchool:
            return .accessToken

        case .fetchAllSchoolName:
            return .none
        }
    }

    public var errorMap: [Int: SchoolDomainError] {
        switch self {
        default:
            return [
                400: .badRequest,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
