import Foundation

public protocol ActivityRepository {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
    func updateStudentActibity(activityID: String) async throws
    func approveStudentActivity(activityID: String) async throws
    func rejectStudentActivity(activityID: String) async throws
    func deleteStudentActivity(activityID: String) async throws
    func queryMyStudentActivity() async throws -> ActivityContentEntity
    func queryStudentActivityByID(studentID: String) async throws -> ActivityContentEntity
    func queryStudentActivityList() async throws -> ActivityContentEntity
    func queryStudentActivityDetails(activityID: String) async throws -> StudentActivityDetailEntity
}
