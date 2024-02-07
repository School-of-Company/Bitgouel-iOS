import Foundation

public protocol UpdatePostUseCase {
    func callAsFunction(postID: String, req: InputPostRequestDTO) async throws
}
