import Foundation

public struct TeacherSignupUseCaseImpl: TeacherSignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: TeacherSignupRequestDTO) async throws {
        try await authRepository.teacherSignup(req: req)
    }
}
