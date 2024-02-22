import Foundation

public struct PostListsResponseDTO: Decodable {
    public let posts: PostContent

    public init(
        posts: PostContent
    ) {
        self.posts = posts
    }

    public struct PostContent: Decodable {
        public let content: [PostInfo]
    }

    public struct PostInfo: Decodable {
        public let postID: String
        public let title: String
        public let modifiedAt: String

        enum CodingKeys: String, CodingKey {
            case postID = "id"
            case title
            case modifiedAt
        }
    }
}

extension PostListsResponseDTO {
    func toDomain() -> PostContentEntity {
        PostContentEntity(content: posts.toDomain())
    }
}

extension PostListsResponseDTO.PostContent {
    func toDomain() -> [PostEntity] {
        content.map { $0.toDomain() }
    }
}

extension PostListsResponseDTO.PostInfo {
    func toDomain() -> PostEntity {
        PostEntity(
            postID: postID,
            title: title,
            modifiedAt: modifiedAt
        )
    }
}
