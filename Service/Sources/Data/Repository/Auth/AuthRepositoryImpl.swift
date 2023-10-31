import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: RemoteAuthDataSource
    private let localAuthDataSource: LocalAuthDataSource

    init(
        remoteAuthDataSource: RemoteAuthDataSource,
        localAuthDataSource: LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    public func login(req: LoginRequestDTO) async throws {
        try await remoteAuthDataSource.login(req: req)
    }

    public func reissueToken() async throws {
        try await remoteAuthDataSource.reissueToken()
    }

    public func logout() async throws {
        try await remoteAuthDataSource.logout()
        localAuthDataSource.logout()
    }

    public func withdraw() async throws {
        try await remoteAuthDataSource.withdraw()
        localAuthDataSource.withdraw()
    }

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.studentSignup(req: req)
    }

    public func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await remoteAuthDataSource.teacherSignup(req: req)
    }

    public func professorSignup(req: ProfessorSignupRequestDTO) async throws {
        try await remoteAuthDataSource.professorSignup(req: req)
    }

    public func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws {
        try await remoteAuthDataSource.companyInstructorSignup(req: req)
    }
}
