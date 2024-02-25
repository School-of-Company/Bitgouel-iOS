import Foundation

public struct UpdateStudentActivityUseCaseImpl: UpdateStudentActibityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws {
        try await activityRepository.updateStudentActibity(activityID: activityID)
    }
}
