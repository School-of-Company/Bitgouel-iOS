import Foundation

public struct RejectStudentActivityUseCaseImpl: RejectStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    public init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityId: String) async throws {
        try await activityRepository.rejectStudentActivity(activityId: activityId)
    }
}
