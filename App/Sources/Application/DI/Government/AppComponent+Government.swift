import NeedleFoundation
import Service

public extension AppComponent {
    var remoteGovernmentDataSource: any RemoteGovernmentDataSource {
        shared {
            RemoteGovernmentDataSourceImpl(keychain: keychain)
        }
    }

    var governmentRepository: any GovernmentRepository {
        shared {
            GovernmentRepositoryImpl(remoteGovernmentDataSource: remoteGovernmentDataSource)
        }
    }

    var fetchGovernmentListUseCase: any FetchGovernmentListUseCase {
        FetchGovernmentUseCaseImpl(governmentRepository: governmentRepository)
    }

    var createdGovernmentUseCase: any CreatedGovernmentUseCase {
        CreatedGovernmentUseCaseImpl(governmentRepository: governmentRepository)
    }

    var deleteGovernmentUseCase: any DeleteGovernmentUseCase {
        DeleteGovernmentUseCaseImpl(governmentRepository: governmentRepository)
    }
}
