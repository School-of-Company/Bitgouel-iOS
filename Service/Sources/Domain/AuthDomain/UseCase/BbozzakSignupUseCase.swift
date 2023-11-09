import Foundation

public protocol BbozzakSignupUseCase {
    func callAsFunction(req: BbozzakSignupRequestDTO) async throws
}
