import Foundation

public struct PostRepositoryImpl: PostRepository {
    private let remotePostDataSource: RemotePostDataSource

    public init(remotePostDataSource: RemotePostDataSource) {
        self.remotePostDataSource = remotePostDataSource
    }

    public func writePost(req: InputPostRequestDTO) async throws {
        try await remotePostDataSource.writePost(req: req)
    }

    public func fetchPostList(postType: FeedType) async throws -> PostContentEntity {
        try await remotePostDataSource.fetchPostList(postType: postType)
    }

    public func fetchPostDetail(postID: String) async throws -> PostDetailEntity {
        try await remotePostDataSource.fetchPostDetail(postID: postID)
    }

    public func updatePost(postID: String, req: UpdatePostRequestDTO) async throws {
        try await remotePostDataSource.updatePost(postID: postID, req: req)
    }

    public func deletePost(postID: String) async throws {
        try await remotePostDataSource.deletePost(postID: postID)
    }
}
