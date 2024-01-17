import Foundation

public protocol ChangePasswordUseCase {
    func callAsFunction(req: ChangePasswordRequestDTO) async throws
}
