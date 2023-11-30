import Foundation

public protocol ActivityRepository {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
    func updateStudentActibity(userID: String) async throws
}
