import Foundation

public struct RejectStudentActivityUseCaseImpl: RejectStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    public init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws {
        try await activityRepository.rejectStudentActivity(activityID: activityID)
    }
}
