import NeedleFoundation
import Service

public extension AppComponent {
    var remoteActivityDataSource: any RemoteActivityDataSource {
        shared {
            RemoteActivityDataSourceImpl(keychain: keychain)
        }
    }

    var activityRepository: any ActivityRepository {
        shared {
            ActivityRepositoryImpl(remoteActivityDataSource: remoteActivityDataSource)
        }
    }

    var inputActivityUseCase: any InputActivityUseCase {
        shared {
            InputActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var deleteActivityUseCase: any DeleteActivityUseCase {
        shared {
            DeleteActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var fetchMyActivityUseCase: any FetchMyActivityUseCase {
        shared {
            FetchMyActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var fetchActivityByIDUseCase: any FetchActivityByIDUseCase {
        shared {
            FetchActivityByIDUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var fetchActivityListUseCase: any FetchActivityListUseCase {
        shared {
            FetchActivityListUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var fetchActivityDetailUseCase: any FetchActivityDetailUseCase {
        shared {
            FetchActivityDetailUseCaseImpl(activityRepository: activityRepository)
        }
    }
}
