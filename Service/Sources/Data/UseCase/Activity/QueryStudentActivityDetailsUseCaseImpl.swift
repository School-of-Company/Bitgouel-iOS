import Foundation

public struct QueryStudentActivityDetailsUseCaseImpl: QueryStudentActivityDetailsUseCase {
    public let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(activityId: String) async throws -> StudentActivityDetailEntity {
        try await activityRepository.queryStudentActivityDetails(activityId: activityId)
    }
}
