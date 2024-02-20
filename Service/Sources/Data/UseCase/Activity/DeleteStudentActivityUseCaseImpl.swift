import Foundation

public struct DeleteStudentActivityUseCaseImpl: DeleteStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    public init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityId: String) async throws {
        try await activityRepository.deleteStudentActivity(activityId: activityId)
    }
}
