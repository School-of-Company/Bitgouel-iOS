import Foundation

public final class RemoteActivityDataSourceImpl: BaseRemoteDataSource<ActivityAPI>, RemoteActivityDataSource {
    public func inputActivity(req: InputActivityRequestDTO) async throws {
        try await request(.inputActivity(req: req))
    }

    public func updateActibity(activityID: String, req: InputActivityRequestDTO) async throws {
        try await request(.updateActibity(activityID: activityID, req: req))
    }

    public func deleteActivity(activityID: String) async throws {
        try await request(.deleteActivity(activityID: activityID))
    }

    public func fetchMyActivity() async throws -> ActivityContentEntity {
        try await request(.fetchMyActivity, dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func fetchActivityByID(studentID: String) async throws -> ActivityContentEntity {
        try await request(.fetchActivityByID(studentID: studentID), dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func fetchActivityList() async throws -> ActivityContentEntity {
        try await request(.fetchActivityList, dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func fetchActivityDetails(activityID: String) async throws -> ActivityDetailEntity {
        try await request(
            .fetchActivityDetails(activityID: activityID),
            dto: ActivityDetailResponseDTO.self
        )
        .toDomain()
    }
}
