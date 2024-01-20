import Foundation

public struct WritePostUseCaseImpl: WritePostUseCase {
    private let postRepository: any PostRepository
    
    public init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }
    
    public func callAsFunction(req: InputPostRequestDTO) async throws {
        try await postRepository.writePost(req: req)
    }
}
