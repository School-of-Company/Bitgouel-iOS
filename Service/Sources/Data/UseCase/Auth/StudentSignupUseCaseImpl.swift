import Foundation

public struct StudentSignupUseCaseImpl: StudentSignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: StudentSignupRequestDTO) async throws {
        try await authRepository.studentSignup(req: req)
    }
}
