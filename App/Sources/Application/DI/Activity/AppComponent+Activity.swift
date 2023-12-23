import NeedleFoundation
import Service

public extension AppComponent {
    var remoteDataSource: any RemoteActivityDataSource {
        shared {
            RemoteActivityDataSourceImpl(keychain: keychain)
        }
    }

    var activityRepository: any ActivityRepository {
        shared {
            ActivityRepositoryImpl(remoteActivityDataSource: remoteDataSource)
        }
    }

    var addStudentActivityUseCase: any AddStudentActivityUseCase {
        shared {
            AddStudentActivityUseCaseImpl(activityRepository: activityRepository)
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
            QueryMyStudentActivityUseCaseStub()
//            QueryMyStudentActivityUseCaseImpl(activityRepository: activityRepository)
        }
    }

    var queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase {
        shared {
            QueryStudentActivityByIdUseCaseImpl(activityRepository: activityRepository)
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
