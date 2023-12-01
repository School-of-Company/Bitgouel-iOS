import Foundation

struct QueryStudentActivityDetailsUseCaseImpl: QueryStudentActivityDetailsUseCase {
    public let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(userID: String) async throws {
        try await activityRepository.queryStudentActivityDetails(userID: userID)
    }
}
