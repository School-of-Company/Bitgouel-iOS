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
}
