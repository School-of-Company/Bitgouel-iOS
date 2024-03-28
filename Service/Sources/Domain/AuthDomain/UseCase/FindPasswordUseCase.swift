import Foundation

public protocol FindPasswordUseCase {
    func callAsFunction(req: FindPasswordRequestDTO) async throws
}
