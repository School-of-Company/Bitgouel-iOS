import NeedleFoundation
import Service

public extension AppComponent {
    var localAuthDataSource: any LocalAuthDataSource {
        shared {
            LocalAuthDataSourceImpl(keychain: keychain)
        }
    }
    
    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
            RemoteAuthDataSourceImpl(keychian: keychain)
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
