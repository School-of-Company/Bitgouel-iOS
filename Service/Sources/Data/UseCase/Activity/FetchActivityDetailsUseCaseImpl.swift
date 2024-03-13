import Foundation

public struct QueryActivityDetailsUseCaseImpl: FetchActivityDetailsUseCase {
    public let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws -> ActivityDetailEntity {
        try await activityRepository.fetchActivityDetails(activityID: activityID)
    }
}
