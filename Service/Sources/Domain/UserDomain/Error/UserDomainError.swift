import Foundation

public enum UserDomainError: Error {
    case badRequest
    case unauthorized
    case notFound
    case conflict
    case tooManyRequest
}
