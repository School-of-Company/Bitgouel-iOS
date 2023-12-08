import Foundation

public protocol UpdateStudentActibityUseCase {
    func callAsFunction(userID: String) async throws
}
