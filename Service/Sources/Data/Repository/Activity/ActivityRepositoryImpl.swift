import Foundation

public struct ActivityRepositoryImpl: ActivityRepository {
    private let remoteActivityDataSource: any RemoteActivityDataSource

    public init(remoteActivityDataSource: any RemoteActivityDataSource) {
        self.remoteActivityDataSource = remoteActivityDataSource
    }

    public func inputActivity(req: InputActivityRequestDTO) async throws {
        try await remoteActivityDataSource.inputActivity(req: req)
    }

    public func updateActibity(activityID: String, req: InputActivityRequestDTO) async throws {
        try await remoteActivityDataSource.updateActibity(activityID: activityID, req: req)
    }

    public func deleteActivity(activityID: String) async throws {
        try await remoteActivityDataSource.deleteActivity(activityID: activityID)
    }

    public func fetchMyActivity() async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.fetchMyActivity()
    }

    public func fetchActivityByID(studentID: String) async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.fetchActivityByID(studentID: studentID)
    }

    public func fetchActivityList() async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.fetchActivityList()
    }

    public func fetchActivityDetails(activityID: String) async throws -> ActivityDetailEntity {
        try await remoteActivityDataSource.fetchActivityDetails(activityID: activityID)
    }
}
