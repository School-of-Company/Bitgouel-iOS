import Foundation
import Moya

public enum CertificationAPI {
    case queryCertificationListByTeacher(studentID: String)
    case queryCertificationListByStudent
    case inputCertification(req: InputCertificationRequestDTO)
    case updateCertification(certificationID: String, req: InputCertificationRequestDTO)
}

extension CertificationAPI: BitgouelAPI {
    public typealias ErrorType = CertificationDomainError

    public var domain: BitgouelDomain {
        .certification
    }

    public var urlPath: String {
        switch self {
        case .queryCertificationListByStudent,
             .inputCertification:
            return ""
        case let .queryCertificationListByTeacher(studentID):
            return "/\(studentID)"
        case let .updateCertification(certificationID, _):
            return "/\(certificationID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .inputCertification:
            return .post
        case .queryCertificationListByTeacher,
             .queryCertificationListByStudent:
            return .get
        case .updateCertification:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case .queryCertificationListByTeacher,
             .queryCertificationListByStudent:
            return .requestPlain
        case let .inputCertification(req),
             let .updateCertification(_, req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int: CertificationDomainError] {
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
