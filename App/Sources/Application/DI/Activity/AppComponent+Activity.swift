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

    var addStudentActivityUseCase: any AddStudentActivityUseCase {
        shared {
            AddStudentActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var rejectStudentActivityUseCase: any RejectStudentActivityUseCase {
        shared {
            RejectStudentActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var approveStudentActivityUseCase: any ApproveStudentActivityUseCase {
        shared {
            ApproveStudentActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var deleteStudentActivityUseCase: any DeleteStudentActivityUseCase {
        shared {
            DeleteStudentActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase {
        shared {
            QueryMyStudentActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var queryStudentActivityByIDUseCase: any QueryStudentActivityByIDUseCase {
        shared {
            QueryStudentActivityByIDUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var queryStudentActivityListUseCase: any QueryStudentActivityListUseCase {
        shared {
            QueryStudentActivityListUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase {
        shared {
            QueryStudentActivityDetailsUseCaseImpl(activityRepository: activityRepository)
        }
    }
}
