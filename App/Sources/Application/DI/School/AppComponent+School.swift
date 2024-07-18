import NeedleFoundation
import Service

public extension AppComponent {
    var remoteSchoolDataSource: any RemoteSchoolDataSource {
        shared {
            RemoteSchoolDataSourceImpl(keychain: keychain)
        }
    }

    var schoolRepository: any SchoolRepository {
        SchoolRepositoryImpl(remoteSchoolDataSource: remoteSchoolDataSource)
    }

    var fetchSchoolListUseCase: any FetchSchoolListUseCase {
        FetchSchoolListUseCaseImpl(schoolRepository: schoolRepository)
    }

    var fetchAllSchoolNameUseCase: any FetchAllSchoolNameUseCase {
        FetchAllSchoolNameUseCaseImpl(schoolRepository: schoolRepository)
    }

    var createdSchoolUseCase: any CreatedSchoolUseCase {
        CreatedSchoolUseCaseImpl(schoolRepository: schoolRepository)
    }

    var modifySchoolUseCase: any ModifySchoolUseCase {
        ModifySchoolUseCaseImpl(schoolRepository: schoolRepository)
    }

    var deleteSchoolUseCase: any DeleteSchoolUseCase {
        DeleteSchoolUseCaseImpl(schoolRepository: schoolRepository)
    }
}
