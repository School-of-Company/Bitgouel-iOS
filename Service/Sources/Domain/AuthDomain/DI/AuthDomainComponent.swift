import NeedleFoundation

public protocol AuthDomainDependency: Dependency {
    var authDomainBuildable: AuthDomainBuildable { get }
}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainBuildable {
    public var loginUseCase: LoginUseCase {
        LoginUseCaseImpl(authRepository: authRepository)
    }
    public var reissueTokenUseCase: ReissueTokenUseCase {
        ReissueTokenUseCaseImpl(authRepository: authRepository)
    }
    public var logoutUseCase: LogoutUseCase {
        LogoutUseCaseImpl(authRepository: authRepository)
    }
    public var withdrawalUseCase: WithdrawalUseCase {
        WithdrawalUseCaseImpl(authRepository: authRepository)
    }
    public var studentSignupUseCase: StudentSignupUseCase {
        StudentSignupUseCaseImpl(authRepository: authRepository)
    }
    public var teacherSignupUseCase: TeacherSignupUseCase {
        TeacherSignupUseCaseImpl(authRepository: authRepository)
    }
    public var bbozzakSignupUseCase: BbozzakSignupUseCase {
        BbozzakSingupUseCaseImpl(authRepository: authRepository)
    }
    public var professorSignupUseCase: ProfessorSignupUseCase {
        ProfessorSignupUseCaseImpl(authRepository: authRepository)
    }
    public var governmentSignupUseCase: GovernmentSignupUseCase {
        GovernmentSignupUseCaseImpl(authRepository: authRepository)
    }
    public var companyInstructorSignupUseCase: CompanyInstructorSignupUseCase {
        CompanyInstructorSignupUseCaseImpl(authRepository: authRepository)
    }
    public var authRepository: AuthRepository {
        AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            localAuthDataSource: localAuthDataSource
        )
    }
    var remoteAuthDataSource: RemoteAuthDataSource {
        RemoteAuthDataSource(keychian: KeychainFake())
    }
    var localAuthDataSource: LocalAuthDataSource {
        LocalAuthDataSource(keychain: KeychainFake())
    }
}
