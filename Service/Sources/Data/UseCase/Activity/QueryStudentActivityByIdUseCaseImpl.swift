import Foundation

public struct QueryStudentActivityByIDUseCaseImpl: QueryStudentActivityByIDUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(studentID: String) async throws -> [ActivityEntity] {
        try await activityRepository.queryStudentActivityByID(studentID: studentID)
    }
}
