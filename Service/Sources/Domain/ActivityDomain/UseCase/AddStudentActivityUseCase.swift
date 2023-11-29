import Foundation

public protocol AddStudentActivityUseCase {
    func callAsFunction(req: AddStudentActivityRequestDTO) async throws
}
