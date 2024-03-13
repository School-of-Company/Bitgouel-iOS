import Foundation

public protocol FetchActivityDetailUseCase {
    func callAsFunction(activityID: String) async throws -> ActivityDetailEntity
}
