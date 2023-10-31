import Foundation

public protocol GovernmentSignup {
    func callAsFunction(req: GovernmentSignupRequestDTO) async throws
}
