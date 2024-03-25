import Foundation

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public let keychain: Keychain
    
    public init(keychain: any Keychain) {
        self.keychain = keychain
        super.init(keychain: keychain)
    }

    public func login(req: LoginRequestDTO) async throws -> UserLoginEntity {
        try await request(.login(req: req), dto: LoginResponseDTO.self).toDomain()
    }

    public func reissueToken() async throws {
        try await request(.reissueToken)
    }

    public func logout(accessToken: String, refreshToken: String) async throws {
        try await request(
            .logout(
                accessToken: keychain.load(type: .accessToken),
                refreshToken: keychain.load(type: .refreshToken)
            )
        )
    }

    public func withdraw() async throws {
        try await request(.withdraw)
    }

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req: req))
    }

    public func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await request(.teacherSignup(req: req))
    }

    public func bbozzakSignup(req: BbozzakSignupRequestDTO) async throws {
        try await request(.bbozzakSignup(req: req))
    }

    public func professorSignup(req: ProfessorSignupRequestDTO) async throws {
        try await request(.professorSignup(req: req))
    }

    public func governmentSignup(req: GovernmentSignupRequestDTO) async throws {
        try await request(.governmentSignup(req: req))
    }

    public func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws {
        try await request(.companyInstructorSignup(req: req))
    }

    public func findPassword(req: FindPasswordRequestDTO) async throws {
        try await request(.findPassword(req: req))
    }
}
