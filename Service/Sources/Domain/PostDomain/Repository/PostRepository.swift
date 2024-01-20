import Foundation

public protocol PostRepository {
    func writePost(req: InputPostRequestDTO) async throws
    func queryPostList() async throws -> [PostEntity]
    func queryPostDetail(postID: String) async throws -> PostDetailEntity
    func updatePost(postID: String, req: InputPostRequestDTO) async throws
    func deletePost(postID: String) async throws
}
