import Foundation

public enum ActivityDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case tooManyRequest
}
