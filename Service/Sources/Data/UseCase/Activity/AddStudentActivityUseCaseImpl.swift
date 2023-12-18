import Foundation

public struct AddStudentActivityUseCaseImpl: AddStudentActivityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(req: AddStudentActivityRequestDTO) async throws {
        try await activityRepository.addStudentActivity(req: req)
    }
}
