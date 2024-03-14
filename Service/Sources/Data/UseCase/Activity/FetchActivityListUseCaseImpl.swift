import Foundation

public struct FetchActivityListUseCaseImpl: FetchActivityListUseCase {
    private let activityRepository: any ActivityRepository

    public init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    public func callAsFunction() async throws -> ActivityContentEntity {
        try await activityRepository.fetchActivityList()
    }
}
