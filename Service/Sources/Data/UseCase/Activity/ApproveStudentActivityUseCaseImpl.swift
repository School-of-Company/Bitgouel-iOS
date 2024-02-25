import Foundation

public struct ApproveStudentActivityUseCaseImpl: ApproveStudentActivityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws {
        try await activityRepository.approveStudentActivity(activityID: activityID)
    }
}
