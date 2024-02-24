import Foundation

public struct UpdatePostUseCaseImpl: UpdatePostUseCase {
    private let postRepository: any PostRepository

    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    public func callAsFunction(postID: String, req: UpdatePostRequestDTO) async throws {
        try await postRepository.updatePost(postID: postID, req: req)
    }
}
