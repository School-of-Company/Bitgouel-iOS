import Foundation

public struct UpdateStudentActivityUseCaseImpl: UpdateStudentActibityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(userID: String) async throws {
        try await activityRepository.updateStudentActibity(userID: userID)
    }
}
