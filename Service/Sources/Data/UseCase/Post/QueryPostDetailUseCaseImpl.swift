import Foundation

public struct QueryPostDetailUseCaseImpl: QueryPostDetailUseCase {
    private let postRepository: any PostRepository
    
    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }
    
    public func callAsFunction(postID: String) async throws -> PostDetailEntity {
        try await postRepository.queryPostDetail(postID: postID)
    }
}
