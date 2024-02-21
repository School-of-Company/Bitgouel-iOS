import Foundation

public protocol QueryPostListUseCase {
    func callAsFunction(postType: FeedType) async throws -> [PostEntity]
}
