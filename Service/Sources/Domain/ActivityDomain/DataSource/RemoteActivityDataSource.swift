import Foundation

public protocol RemoteActivityDataSource: BaseRemoteDataSource<ActivityAPI> {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
    func updateStudentActibity(userID: String) async throws
    func approveStudentActivity(userID: String) async throws
    func rejectStudentActivity(userID: String) async throws
    func deleteStudentActivity(userID: String) async throws
    func queryMyStudentActivity() async throws
}
