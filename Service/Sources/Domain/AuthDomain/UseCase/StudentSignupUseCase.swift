import Foundation

public protocol StudentSignupUseCase {
    func execute(req: StudentSignupRequestDTO) async throws
}
