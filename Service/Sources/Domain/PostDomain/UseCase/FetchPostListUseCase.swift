import Foundation

public protocol FetchPostListUseCase {
    func callAsFunction(postType: FeedType) async throws -> PostContentEntity
}
