import Foundation

public protocol RemoteActivityDataSource: BaseRemoteDataSource<ActivityAPI> {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
    func updateStudentActibity(activityId: String) async throws
    func approveStudentActivity(activityId: String) async throws
    func rejectStudentActivity(activityId: String) async throws
    func deleteStudentActivity(activityId: String) async throws
    func queryMyStudentActivity() async throws -> [ActivityEntity]
    func queryStudentActivityById(studentID: String) async throws -> [ActivityEntity]
    func queryStudentActivityList() async throws -> [ActivityEntity]
    func queryStudentActivityDetails(activityId: String) async throws -> StudentActivityDetailEntity
}
