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
}
