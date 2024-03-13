import Foundation

public struct QueryStudentActivityDetailsUseCaseImpl: FetchStudentActivityDetailsUseCase {
    public let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityID: String) async throws -> StudentActivityDetailEntity {
        try await activityRepository.fetchActivityDetails(activityID: activityID)
    }
}
