import NeedleFoundation
import Service

public extension AppComponent {
    var remoteClubDataSource: any RemoteClubDataSource {
        shared {
            RemoteClubDataSourceImpl(keychain: keychain)
        }
    }

    var clubRepository: any ClubRepository {
        shared {
            ClubRepositoryImpl(remoteClubDataSource: remoteClubDataSource)
        }
    }

    var queryClubListUseCase: any QueryClubListUseCase {
        shared {
            QueryClubListUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var queryClubDetailUseCase: any QueryClubDetailUseCase {
        shared {
            QueryClubDatailUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase {
        shared {
            QueryStudentListByClubUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase {
        shared {
            QueryStudentDetailByClubUseCaseImpl(clubRepository: clubRepository)
        }
    }
}
