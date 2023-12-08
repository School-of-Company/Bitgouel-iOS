import Foundation

struct QueryMyStudentActivityUseCaseImpl: QueryMyStudentActivityUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction() async throws {
        try await activityRepository.queryMyStudentActivity()
    }
}
