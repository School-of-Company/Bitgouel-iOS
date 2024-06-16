import Foundation
import Moya

public enum CertificationAPI {
    case fetchCertificationListByTeacher(studentID: String)
    case fetchCertificationListByStudent
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
        case .fetchCertificationListByStudent,
             .inputCertification:
            return ""
        case let .fetchCertificationListByTeacher(studentID):
            return "/\(studentID)"
        case let .updateCertification(certificationID, _):
            return "/\(certificationID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .inputCertification:
            return .post
        case .fetchCertificationListByTeacher,
             .fetchCertificationListByStudent:
            return .get
        case .updateCertification:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchCertificationListByTeacher,
             .fetchCertificationListByStudent:
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
