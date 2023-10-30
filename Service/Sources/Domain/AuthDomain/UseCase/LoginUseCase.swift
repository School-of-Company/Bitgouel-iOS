import Foundation

public protocol LoginUseCase {
    func execute(req: LoginRequestDTO) async throws
}
