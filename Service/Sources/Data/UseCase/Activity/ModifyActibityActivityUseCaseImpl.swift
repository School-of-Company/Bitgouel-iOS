import Foundation

public struct ModifyActivityUseCaseImpl: ModifyActivityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String, req: InputActivityRequestDTO) async throws {
        try await activityRepository.modifyActivity(activityID: activityID, req: req)
    }
}
