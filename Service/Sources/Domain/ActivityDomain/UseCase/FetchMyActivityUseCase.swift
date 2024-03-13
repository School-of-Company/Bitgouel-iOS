import Foundation

public protocol FetchMyActivityUseCase {
    func callAsFunction() async throws -> ActivityContentEntity
}
