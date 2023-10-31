import Foundation

public protocol StudentSignupUseCase {
    func callAsFunction(req: StudentSignupRequestDTO) async throws
}
