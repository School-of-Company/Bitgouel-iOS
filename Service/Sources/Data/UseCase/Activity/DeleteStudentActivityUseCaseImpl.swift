import Foundation

public struct DeleteStudentActivityUseCaseImpl: DeleteStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    public init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws {
        try await activityRepository.deleteStudentActivity(activityID: activityID)
    }
}
