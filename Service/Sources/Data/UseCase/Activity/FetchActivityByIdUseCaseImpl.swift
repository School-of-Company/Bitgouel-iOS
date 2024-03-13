import Foundation

public struct FetchStudentActivityByIDUseCaseImpl: FetchActivityByIDUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(studentID: String) async throws -> ActivityContentEntity {
        try await activityRepository.fetchActivityByID(studentID: studentID)
    }
}
