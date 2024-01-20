import Foundation

public struct PostListsResponseDTO: Decodable {
    public let posts: [PostInfo]
    
    public init(
        posts: [PostInfo]
    ) {
        self.posts = posts
    }
    
    public struct PostInfo: Decodable {
        public let postId: String
        public let title: String
        public let modifedAt: String
    }
}

extension PostListsResponseDTO {
    func toDomain() -> [PostEntity] {
        posts.map { $0.toDomain() }
    }
}

extension PostListsResponseDTO.PostInfo {
    func toDomain() -> PostEntity {
        PostEntity(
            postId: postId,
            title: title,
            modifedAt: modifedAt
        )
    }
}
