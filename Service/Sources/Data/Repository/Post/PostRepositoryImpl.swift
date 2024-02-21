import Foundation

public struct PostRepositoryImpl: PostRepository {
    private let remotePostDataSource: RemotePostDataSource

    public init(remotePostDataSource: RemotePostDataSource) {
        self.remotePostDataSource = remotePostDataSource
    }

    public func writePost(req: InputPostRequestDTO) async throws {
        try await remotePostDataSource.writePost(req: req)
    }

    public func queryPostList(postType: FeedType) async throws -> [PostEntity] {
        try await remotePostDataSource.queryPostList(postType: postType)
    }

    public func queryPostDetail(postID: String) async throws -> PostDetailEntity {
        try await remotePostDataSource.queryPostDetail(postID: postID)
    }

    public func updatePost(postID: String, req: InputPostRequestDTO) async throws {
        try await remotePostDataSource.updatePost(postID: postID, req: req)
    }

    public func deletePost(postID: String) async throws {
        try await remotePostDataSource.deletePost(postID: postID)
    }
}
