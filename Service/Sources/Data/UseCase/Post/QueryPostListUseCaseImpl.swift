import Foundation

public struct QueryPostListUseCaseImpl: QueryPostListUseCase {
    private let postRepository: any PostRepository

    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    public func callAsFunction(postType: FeedType) async throws -> [PostEntity] {
        try await postRepository.queryPostList(postType: postType)
    }
}
