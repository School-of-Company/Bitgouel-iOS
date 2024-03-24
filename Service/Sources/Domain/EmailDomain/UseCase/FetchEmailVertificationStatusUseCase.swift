import Foundation

public protocol FetchEmailVertificationStatusUseCase {
    func callAsFunction(email: String) async throws -> Bool
}
