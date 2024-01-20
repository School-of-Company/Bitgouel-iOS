import Foundation

public struct DeletePostUseCaseImpl: DeletePostUseCase {
    private let postRepository: any PostRepository
    
    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }
    
    public func callAsFunction(postID: String) async throws {
        try await postRepository.deletePost(postID: postID)
    }
}
