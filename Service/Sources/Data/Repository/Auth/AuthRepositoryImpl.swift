import Foundation

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: RemoteAuthDataSource
    private let localAuthDataSource: LocalAuthDataSource

    public init(
        remoteAuthDataSource: RemoteAuthDataSource,
        localAuthDataSource: LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    public func login(req: LoginRequestDTO) async throws -> UserLoginEntity {
        try await remoteAuthDataSource.login(req: req)
    }

    public func saveUserAuthority(authority: UserAuthorityType) {
        localAuthDataSource.saveUserAuthority(authority: authority)
    }

    public func loadUserAuthority() -> UserAuthorityType {
        localAuthDataSource.loadUserAuthority()
    }

    public func reissueToken() async throws {
        try await remoteAuthDataSource.reissueToken()
    }

    public func logout() async throws {
        try await remoteAuthDataSource.logout()
        try await localAuthDataSource.logout()
    }

    public func withdraw() async throws {
        try await remoteAuthDataSource.withdraw()
        try await localAuthDataSource.withdraw()
    }

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.studentSignup(req: req)
    }

    public func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await remoteAuthDataSource.teacherSignup(req: req)
    }

    public func bbozzakSignup(req: BbozzakSignupRequestDTO) async throws {
        try await remoteAuthDataSource.bbozzakSignup(req: req)
    }

    public func professorSignup(req: ProfessorSignupRequestDTO) async throws {
        try await remoteAuthDataSource.professorSignup(req: req)
    }

    public func governmentSignup(req: GovernmentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.governmentSignup(req: req)
    }

    public func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws {
        try await remoteAuthDataSource.companyInstructorSignup(req: req)
    }

    public func findPassword(req: FindPasswordRequestDTO) async throws {
        try await remoteAuthDataSource.findPassword(req: req)
    }
}
