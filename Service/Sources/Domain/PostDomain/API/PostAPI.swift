import Foundation
import Moya

public enum PostAPI {
    case writePost(req: InputPostRequestDTO)
    case queryPostList(postType: FeedType)
    case queryPostDetail(postID: String)
    case updatePost(postID: String, req: InputPostRequestDTO)
    case deletePost(postID: String)
}

extension PostAPI: BitgouelAPI {
    public typealias ErrorType = PostDomainError

    public var domain: BitgouelDomain {
        .post
    }

    public var urlPath: String {
        switch self {
        case .writePost,
             .queryPostList:
            return ""
        case let .queryPostDetail(postID),
             let .updatePost(postID, _),
             let .deletePost(postID):
            return "/\(postID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .writePost:
            return .post
        case .queryPostList,
             .queryPostDetail:
            return .get
        case .updatePost:
            return .patch
        case .deletePost:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .writePost(req),
             let .updatePost(_, req):
            return .requestJSONEncodable(req)

        case let .queryPostList(postType):
            return .requestParameters(parameters: [
                "type": postType.rawValue
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

    public var errorMap: [Int : PostDomainError] {
        switch self {
        case .writePost,
             .updatePost,
             .deletePost:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                429: .tooManyRequest
            ]
        case .queryPostList,
             .queryPostDetail:
            return [
                400: .badRequest,
                401: .unauthorized,
                404: .notFound,
                429: .tooManyRequest
            ]
        }
    }
}
