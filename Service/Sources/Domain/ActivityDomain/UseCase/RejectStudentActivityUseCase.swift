import Foundation

public protocol RejectStudentActivityUseCase {
    func callAsFunction(userID: String) async throws
}
