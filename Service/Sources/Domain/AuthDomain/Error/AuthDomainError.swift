import Foundation

public enum AuthDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case tooManyRequest
    case internalServerError
}
