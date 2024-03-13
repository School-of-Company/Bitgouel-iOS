import Foundation

public struct UpdateActivityUseCaseImpl: UpdateActibityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String, req: InputActivityRequestDTO) async throws {
        try await activityRepository.updateActibity(activityID: activityID, req: req)
    }
}
