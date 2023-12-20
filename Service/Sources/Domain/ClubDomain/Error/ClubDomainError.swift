import Foundation

public enum ClubDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case tooManyRequest
}
