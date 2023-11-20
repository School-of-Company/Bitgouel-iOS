import Foundation

public protocol GovernmentSignupUseCase {
    func callAsFunction(req: GovernmentSignupRequestDTO) async throws
}
