import Foundation

public protocol DeleteStudentActivityUseCase {
    func callAsFunction(userID: String) async throws
}
