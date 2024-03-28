import NeedleFoundation
import Service

public extension AppComponent {
    var remoteAdminDataSource: any RemoteAdminDataSource {
        shared {
            RemoteAdminDataSourceImpl(keychain: keychain)
        }
    }

    var adminRepository: any AdminRepository {
        shared {
            AdminRespositoryImpl(remoteAdminDataSource: remoteAdminDataSource)
        }
    }

    var fetchUserListUseCase: any FetchUserListUseCase {
        shared {
            FetchUserListUseCaseImpl(adminRepository: adminRepository)
        }
    }

    var fetchUserDetailUseCase: any FetchUserDetailUseCase {
        shared {
            FetchUserDetailUseCaseImpl(adminRepository: adminRepository)
        }
    }

    var approveUserSignupUseCase: any ApproveUserSignupUseCase {
        shared {
            ApproveUserSignupUseCaseImpl(adminRepository: adminRepository)
        }
    }

    var rejectUserSignupUseCase: any RejectUserSignupUseCase {
        shared {
            RejectUserSignupUseCaseImpl(adminRepository: adminRepository)
        }
    }

    var withdrawUserUseCase: any WithdrawUserUseCase {
        shared {
            WithdrawUserUseCaseImpl(adminRepository: adminRepository)
        }
    }
}
