import Foundation

public protocol WritePostUseCase {
    func callAsFunction(req: InputPostRequestDTO) async throws
}
