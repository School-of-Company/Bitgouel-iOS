import Foundation

public protocol SendEmailCertificationLinkUseCase {
    func callAsFunction(email: String) async throws
}
