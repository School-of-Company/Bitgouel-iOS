import Foundation

public protocol FetchPostDetailUseCase {
    func callAsFunction(postID: String) async throws -> PostDetailEntity
}
