import Foundation

public struct ActivityRepositoryImpl: ActivityRepository {
    private let remoteActivityDataSource: RemoteActivityDataSource

    public init(remoteActivityDataSource: RemoteActivityDataSource) {
        self.remoteActivityDataSource = remoteActivityDataSource
    }

    public func addStudentActivity(req: AddStudentActivityRequestDTO) async throws {
        try await remoteActivityDataSource.addStudentActivity(req: req)
    }

    public func updateStudentActibity(activityId: String) async throws {
        try await remoteActivityDataSource.updateStudentActibity(activityId: activityId)
    }

    public func approveStudentActivity(activityId: String) async throws {
        try await remoteActivityDataSource.approveStudentActivity(activityId: activityId)
    }

    public func rejectStudentActivity(activityId: String) async throws {
        try await remoteActivityDataSource.rejectStudentActivity(activityId: activityId)
    }

    public func deleteStudentActivity(activityId: String) async throws {
        try await remoteActivityDataSource.deleteStudentActivity(activityId: activityId)
    }

    public func queryMyStudentActivity() async throws -> [ActivityEntity] {
        try await remoteActivityDataSource.queryMyStudentActivity()
    }

    public func queryStudentActivityById(studentID: String) async throws -> [ActivityEntity] {
        try await remoteActivityDataSource.queryStudentActivityById(studentID: studentID)
    }

    public func queryStudentActivityList() async throws -> [ActivityEntity] {
        try await remoteActivityDataSource.queryStudentActivityList()
    }

    public func queryStudentActivityDetails(activityId: String) async throws -> StudentActivityDetailEntity {
        try await remoteActivityDataSource.queryStudentActivityDetails(activityId: activityId)
    }
}
