import Foundation

public struct FetchPostDetailUseCaseImpl: FetchPostDetailUseCase {
    private let postRepository: any PostRepository

    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    public func callAsFunction(postID: String) async throws -> PostDetailEntity {
        try await postRepository.fetchPostDetail(postID: postID)
    }
}
