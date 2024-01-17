import NeedleFoundation
import Service

public extension AppComponent {
    var remoteUserDataSource: any RemoteUserDataSource {
        shared {
            RemoteUserDataSourceImpl(keychain: keychain)
        }
    }
    
    var userRepository: any UserRepository {
        shared {
            UserRepositoryImpl(remoteUserDataSource: remoteUserDataSource)
        }
    }
    
    var changePasswordUseCase: any ChangePasswordUseCase {
        shared {
            ChangePasswordUseCaseImpl(userRepository: userRepository)
        }
    }
    
    var queryMyInfoUseCase: any QueryMyInfoUseCase {
        shared {
            QueryMyInfoUseCaseImpl(userRepository: userRepository)
        }
    }
}
