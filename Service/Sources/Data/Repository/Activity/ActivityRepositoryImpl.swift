import Foundation

public struct ActivityRepositoryImpl: ActivityRepository {
    private let remoteActivityDataSource: RemoteActivityDataSource

    public init(remoteActivityDataSource: RemoteActivityDataSource) {
        self.remoteActivityDataSource = remoteActivityDataSource
    }

    public func addStudentActivity(req: AddStudentActivityRequestDTO) async throws {
        try await remoteActivityDataSource.addStudentActivity(req: req)
    }

    public func updateStudentActibity(activityID: String) async throws {
        try await remoteActivityDataSource.updateStudentActibity(activityID: activityID)
    }

    public func approveStudentActivity(activityID: String) async throws {
        try await remoteActivityDataSource.approveStudentActivity(activityID: activityID)
    }

    public func rejectStudentActivity(activityID: String) async throws {
        try await remoteActivityDataSource.rejectStudentActivity(activityID: activityID)
    }

    public func deleteStudentActivity(activityID: String) async throws {
        try await remoteActivityDataSource.deleteStudentActivity(activityID: activityID)
    }

    public func queryMyStudentActivity() async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.queryMyStudentActivity()
    }

    public func queryStudentActivityByID(studentID: String) async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.queryStudentActivityByID(studentID: studentID)
    }

    public func queryStudentActivityList() async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.queryStudentActivityList()
    }

    public func queryStudentActivityDetails(activityID: String) async throws -> StudentActivityDetailEntity {
        try await remoteActivityDataSource.queryStudentActivityDetails(activityID: activityID)
    }
}
