import Foundation

public enum ActivityDomainError: Error {
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
