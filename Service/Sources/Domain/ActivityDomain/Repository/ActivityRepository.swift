import Foundation

public protocol ActivityRepository {
    func addStudentActivity(req: AddStudentActivityRequestDTO) async throws
}
