import Foundation

struct AddStudentActivityUseCaseImpl: AddStudentActivityUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(req: AddStudentActivityRequestDTO) async throws {
        try await activityRepository.addStudentActivity(req: req)
    }
}
