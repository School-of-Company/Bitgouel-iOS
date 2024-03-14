import Foundation

public protocol FetchActivityDetailsUseCase {
    func callAsFunction(activityID: String) async throws -> ActivityDetailEntity
}
