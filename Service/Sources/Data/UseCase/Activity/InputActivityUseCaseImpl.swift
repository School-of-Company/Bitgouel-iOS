import Foundation

public struct InputStudentActivityUseCaseImpl: InputActivityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(req: InputActivityRequestDTO) async throws {
        try await activityRepository.inputActivity(req: req)
    }
}
