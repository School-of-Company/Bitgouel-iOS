import Foundation

public struct ApproveStudentActivityUseCaseImpl: ApproveStudentActivityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityId: String) async throws {
        try await activityRepository.approveStudentActivity(activityId: activityId)
    }
}
