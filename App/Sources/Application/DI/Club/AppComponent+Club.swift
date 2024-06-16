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

    var fetchClubListUseCase: any FetchClubListUseCase {
        shared {
            FetchClubListUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var fetchClubDetailUseCase: any FetchClubDetailUseCase {
        shared {
            FetchClubDatailUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase {
        shared {
            FetchStudentListByClubUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var fetchStudentDetailByClubUseCase: any FetchStudentDetailByClubUseCase {
        shared {
            FetchStudentDetailByClubUseCaseImpl(clubRepository: clubRepository)
        }
    }
}
