import Foundation

public struct DeleteActivityUseCaseImpl: DeleteActivityUseCase {
    private let activityRepository: ActivityRepository

    public init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws {
        try await activityRepository.deleteActivity(activityID: activityID)
    }
}
