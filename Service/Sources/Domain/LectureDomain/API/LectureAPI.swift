import Foundation
import Moya

public enum LectureAPI {
    case lectureOpen(LectureOpenRequestDTO)
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
        }
    }

    public var method: Moya.Method {
        switch self {
        case .lectureOpen:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .lectureOpen(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .lectureOpen(_):
            return .accessToken
        }
    }

    public var errorMap: [Int : LectureDomainError] {
        switch self {
        case .lectureOpen(_):
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                409: .conflict
            ]
        }
    }
}
