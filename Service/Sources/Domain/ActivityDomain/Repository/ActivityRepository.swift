import Foundation

public protocol ActivityRepository {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
    func updateStudentActibity(userID: String) async throws
    func approveStudentActivity(userID: String) async throws
    func rejectStudentActivity(userID: String) async throws
    func deleteStudentActivity(userID: String) async throws
    func queryMyStudentActivity() async throws
    func queryStudentActivityById(studentID: String) async throws
    func queryStudentActivityList() async throws
    func queryStudentActivityDetails(userID: String) async throws
}
