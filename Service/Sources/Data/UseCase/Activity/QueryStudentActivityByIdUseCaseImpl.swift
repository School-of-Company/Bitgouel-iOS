import Foundation

public struct QueryStudentActivityByIdUseCaseImpl: QueryStudentActivityByIdUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction(studentID: String) async throws -> [ActivityEntity] {
        try await activityRepository.queryStudentActivityById(studentID: studentID)
    }
}
