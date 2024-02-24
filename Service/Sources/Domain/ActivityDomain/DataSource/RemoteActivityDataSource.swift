import Foundation

public protocol RemoteActivityDataSource: BaseRemoteDataSource<ActivityAPI> {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
    func updateStudentActibity(activityID: String) async throws
    func approveStudentActivity(activityID: String) async throws
    func rejectStudentActivity(activityID: String) async throws
    func deleteStudentActivity(activityID: String) async throws
    func queryMyStudentActivity() async throws -> [ActivityEntity]
    func queryStudentActivityByID(studentID: String) async throws -> [ActivityEntity]
    func queryStudentActivityList() async throws -> [ActivityEntity]
    func queryStudentActivityDetails(activityID: String) async throws -> StudentActivityDetailEntity
}
