public protocol AuthDomainBuildable {
    var loginUseCase: LoginUseCase { get }
    var reissueTokenUseCase: ReissueTokenUseCase { get }
    var logoutUseCase: LogoutUseCase { get }
    var withdrawalUseCase: WithdrawalUseCase { get }
    var studentSignupUseCase: StudentSignupUseCase { get }
    var teacherSignupUseCase: TeacherSignupUseCase { get }
    var bbozzakSignupUseCase: BbozzakSignupUseCase { get }
    var professorSignupUseCase: ProfessorSignupUseCase { get }
    var governmentSignupUseCase: GovernmentSignupUseCase { get }
    var companyInstructorSignupUseCase: CompanyInstructorSignupUseCase { get }
    var authRepository: AuthRepository { get }
}
