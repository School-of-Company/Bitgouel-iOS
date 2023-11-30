import Foundation

struct DeleteStudentActivityUseCaseImpl: DeleteStudentActivityUseCase {
    private let activityRepository: ActivityRepository

    init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(userID: String) async throws {
        try await activityRepository.deleteStudentActivity(userID: userID)
    }
}
