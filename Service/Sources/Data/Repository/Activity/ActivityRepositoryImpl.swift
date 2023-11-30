import Foundation

public struct ActivityRepositoryImpl: ActivityRepository {
    private let remoteActivityDataSource: RemoteActivityDataSource

    public init(remoteActivityDataSource: RemoteActivityDataSource) {
        self.remoteActivityDataSource = remoteActivityDataSource
    }

    public func addStudentActivity(req: AddStudentActivityRequestDTO) async throws {
        try await remoteActivityDataSource.addStudentActivity(req: req)
    }

    public func updateStudentActibity(userID: String) async throws {
        try await remoteActivityDataSource.updateStudentActibity(userID: userID)
    }

    public func approveStudentActivity(userID: String) async throws {
        try await remoteActivityDataSource.approveStudentActivity(userID: userID)
    }

    public func rejectStudentActivity(userID: String) async throws {
        try await remoteActivityDataSource.rejectStudentActivity(userID: userID)
    }

    public func deleteStudentActivity(userID: String) async throws {
        try await remoteActivityDataSource.deleteStudentActivity(userID: userID)
    }

    public func queryMyStudentActivity() async throws {
        try await remoteActivityDataSource.queryMyStudentActivity()
    }

    public func queryStudentActivityById(studentID: String) async throws {
        try await remoteActivityDataSource.queryStudentActivityById(studentID: studentID)
    }
    
    public func queryStudentActivityList() async throws {
        try await remoteActivityDataSource.queryStudentActivityList()
    }
}
