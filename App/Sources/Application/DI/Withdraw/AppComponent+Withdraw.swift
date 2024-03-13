import NeedleFoundation
import Service

public extension AppComponent {
    var remoteWithdrawDataSource: any RemoteWithdrawDataSource {
        shared {
            RemoteWithdrawDataSourceImpl(keychain: keychain)
        }
    }

    var withdrawRepository: any WithdrawRepository {
        WithdrawRepositoryImpl(remoteWithdrawDataSource: remoteWithdrawDataSource)
    }

    var fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase {
        shared {
            FetchWithdrawUserListUseCaseImpl(withdrawRepository: withdrawRepository)
        }
    }
}
