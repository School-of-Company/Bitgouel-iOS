import NeedleFoundation
import Service

public extension AppComponent {
    var localAuthDataSource: LocalAuthDataSource {
        shared {
            LocalAuthDataSource(keychain: keychain)
        }
    }
    
    var remoteAuthDataSource: RemoteAuthDataSource {
        shared {
            RemoteAuthDataSource(keychian: keychain)
        }
    }
    
    var authRepository: AuthRepository {
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
    
    var withdrawUseCase: any WithdrawalUseCase {
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
    
    
}
