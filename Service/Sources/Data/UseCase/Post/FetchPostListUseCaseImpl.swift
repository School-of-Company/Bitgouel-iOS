import Foundation

public struct FetchPostListUseCaseImpl: FetchPostListUseCase {
    private let postRepository: any PostRepository

    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    public func callAsFunction(postType: FeedType) async throws -> PostContentEntity {
        try await postRepository.fetchPostList(postType: postType)
    }
}
