import Foundation

public protocol InputActivityUseCase {
    func callAsFunction(req: InputActivityRequestDTO) async throws
}
