import Foundation

public struct DeleteStudentActivityUseCaseImpl: DeleteStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    public init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await activityRepository.deleteStudentActivity(userID: userID)
    }
}
