import Foundation

public struct UpdateStudentActivityUseCaseImpl: UpdateStudentActibityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityId: String) async throws {
        try await activityRepository.updateStudentActibity(activityId: activityId)
    }
}
