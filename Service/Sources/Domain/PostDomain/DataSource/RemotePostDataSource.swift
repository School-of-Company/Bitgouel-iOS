import Foundation

public protocol RemotePostDataSource: BaseRemoteDataSource<PostAPI> {
    func writePost(req: InputPostRequestDTO) async throws
    func fetchPostList(postType: FeedType) async throws -> PostContentEntity
    func fetchPostDetail(postID: String) async throws -> PostDetailEntity
    func updatePost(postID: String, req: UpdatePostRequestDTO) async throws
    func deletePost(postID: String) async throws
}
