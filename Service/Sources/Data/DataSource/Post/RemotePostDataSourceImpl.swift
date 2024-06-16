import Foundation

public final class RemotePostDataSourceImpl: BaseRemoteDataSource<PostAPI>, RemotePostDataSource {
    public func writePost(req: InputPostRequestDTO) async throws {
        try await request(.writePost(req: req))
    }

    public func fetchPostList(postType: FeedType) async throws -> PostContentEntity {
        try await request(.fetchPostList(postType: postType), dto: PostListsResponseDTO.self).toDomain()
    }

    public func fetchPostDetail(postID: String) async throws -> PostDetailEntity {
        try await request(.fetchPostDetail(postID: postID), dto: PostDetailResponseDTO.self).toDomain()
    }

    public func updatePost(postID: String, req: UpdatePostRequestDTO) async throws {
        try await request(.updatePost(postID: postID, req: req))
    }

    public func deletePost(postID: String) async throws {
        try await request(.deletePost(postID: postID))
    }
}
