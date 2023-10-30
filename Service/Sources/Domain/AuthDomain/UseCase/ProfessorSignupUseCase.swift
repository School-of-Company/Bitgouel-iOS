import Foundation

public protocol ProfessorSignupUseCase {
    func callAsFunction(req: ProfessorSignupRequestDTO) async throws
}
