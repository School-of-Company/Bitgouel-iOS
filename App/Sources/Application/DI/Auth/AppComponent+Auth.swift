import NeedleFoundation
import Service

public extension AppComponent {
    var localAuthDataSource: any LocalAuthDataSource {
        shared {
            LocalAuthDataSourceImpl(keychain: keychain, userDefaults: .standard)
        }
    }

    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
            RemoteAuthDataSourceImpl(keychain: keychain)
        }
    }

    var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(
                remoteAuthDataSource: remoteAuthDataSource,
                localAuthDataSource: localAuthDataSource
            )
        }
    }

    var loginUseCase: any LoginUseCase {
        shared {
            LoginUseCaseImpl(authRepository: authRepository)
        }
    }

    var saveUserAuthorityUseCase: any SaveUserAuthorityUseCase {
        shared {
            SaveUserAuthorityUseCaseImpl(authRepository: authRepository)
        }
    }

    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        shared {
            LoadUserAuthorityUseCaseImpl(authRepository: authRepository)
        }
    }

    var reissueTokenUseCase: any ReissueTokenUseCase {
        shared {
            ReissueTokenUseCaseImpl(authRepository: authRepository)
        }
    }

    var logoutUseCase: any LogoutUseCase {
        shared {
            LogoutUseCaseImpl(authRepository: authRepository)
        }
    }

    var withdrawalUseCase: any WithdrawalUseCase {
        shared {
            WithdrawalUseCaseImpl(authRepository: authRepository)
        }
    }

    var studentSignupUseCase: any StudentSignupUseCase {
        shared {
            StudentSignupUseCaseImpl(authRepository: authRepository)
        }
    }

    var teacherSignupUseCase: any TeacherSignupUseCase {
        shared {
            TeacherSignupUseCaseImpl(authRepository: authRepository)
        }
    }

    var bbozzakSignupUseCase: any BbozzakSignupUseCase {
        shared {
            BbozzakSingupUseCaseImpl(authRepository: authRepository)
        }
    }

    var professorSignupUseCase: any ProfessorSignupUseCase {
        shared {
            ProfessorSignupUseCaseImpl(authRepository: authRepository)
        }
    }

    var governmentSignupUseCase: any GovernmentSignupUseCase {
        shared {
            GovernmentSignupUseCaseImpl(authRepository: authRepository)
        }
    }

    var companyInstructorSignupUseCase: any CompanyInstructorSignupUseCase {
        shared {
            CompanyInstructorSignupUseCaseImpl(authRepository: authRepository)
        }
    }

    var findPasswordUseCase: any FindPasswordUseCase {
        shared {
            FindPasswordUseCaseImpl(authRepository: authRepository)
        }
    }
}
