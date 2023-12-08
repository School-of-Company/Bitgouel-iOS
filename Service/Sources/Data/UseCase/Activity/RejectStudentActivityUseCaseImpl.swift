import Foundation

struct RejectStudentActivityUseCaseImpl: RejectStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(userID: String) async throws {
        try await activityRepository.rejectStudentActivity(userID: userID)
    }
}
