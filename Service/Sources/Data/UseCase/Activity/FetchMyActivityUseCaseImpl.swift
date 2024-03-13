import Foundation

public struct FetchMyStudentActivityUseCaseImpl: FetchMyActivityUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction() async throws -> ActivityContentEntity {
        try await activityRepository.fetchMyActivity()
    }
}
