import Foundation

public enum PostDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case tooManyRequest
}
