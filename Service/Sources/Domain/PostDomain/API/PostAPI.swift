import Foundation
import Moya

public enum PostAPI {
    case writePost(req: InputPostRequestDTO)
    case fetchPostList(postType: FeedType)
    case fetchPostDetail(postID: String)
    case updatePost(postID: String, req: UpdatePostRequestDTO)
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
             .fetchPostList:
            return ""
        case let .fetchPostDetail(postID),
             let .updatePost(postID, _),
             let .deletePost(postID):
            return "/\(postID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .writePost:
            return .post
        case .fetchPostList,
             .fetchPostDetail:
            return .get
        case .updatePost:
            return .patch
        case .deletePost:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .writePost(req):
            return .requestJSONEncodable(req)

        case let .updatePost(_, req):
            return .requestJSONEncodable(req)

        case let .fetchPostList(postType):
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

    public var errorMap: [Int: PostDomainError] {
        switch self {
        default:
            return [
                403: .forbidden,
                404: .notFound
            ]
        }
    }
}
