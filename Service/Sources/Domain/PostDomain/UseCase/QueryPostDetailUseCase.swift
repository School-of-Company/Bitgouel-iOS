import Foundation

public protocol QueryPostDetailUseCase {
    func callAsFunction(postID: String) async throws -> PostDetailEntity
}
