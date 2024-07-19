import NeedleFoundation
import Service

public extension AppComponent {
    var remoteUniversityDataSource: any RemoteUniversityDataSource {
        shared {
            RemoteUniversityDataSourceImpl(keychain: keychain)
        }
    }

    var universityRepository: any UniversityRepository {
        shared {
            UniversityRepositoryImpl(remoteUniversityDataSource: remoteUniversityDataSource)
        }
    }

    var fetchUniversityListUseCase: any FetchUniversityListUseCase {
        shared {
            FetchUniversityListUseCaseImpl(universityRepository: universityRepository)
        }
    }

    var createdUniversityUseCase: any CreatedUniversityUseCase {
        shared {
            CreatedUniversityUseCaseImpl(universityRepository: universityRepository)
        }
    }

    var modifyUniversityUseCase: any ModifyUniversityUseCase {
        shared {
            ModifyUniversityUseCaseImpl(universityRepository: universityRepository)
        }
    }

    var deleteUniversityUseCase: any DeleteUniversityUseCase {
        shared {
            DeleteUniversityUseCaseImpl(universityRepository: universityRepository)
        }
    }

    var createdDepartmentUseCase: any CreatedDepartmentUseCase {
        shared {
            CreatedDepartmentUseCaseImpl(universityRepository: universityRepository)
        }
    }

    var deleteDepartmentUseCase: any DeleteDepartmentUseCase {
        shared {
            DeleteDepartmentUseCaseImpl(universityRepository: universityRepository)
        }
    }
}
