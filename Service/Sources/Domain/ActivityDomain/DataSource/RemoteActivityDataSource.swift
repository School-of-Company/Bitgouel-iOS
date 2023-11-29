import Foundation

public protocol RemoteActivityDataSource: BaseRemoteDataSource<ActivityAPI> {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
}
