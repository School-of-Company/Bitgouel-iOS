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

    var createdClubUseCase: any CreatedClubUseCase {
        shared {
            CreatedClubUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var modifyClubUseCase: any ModifyClubUseCase {
        shared {
            ModifyClubUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var deleteClubUseCase: any DeleteClubUseCase {
        shared {
            DeleteClubUseCaseImpl(clubRepository: clubRepository)
        }
    }

    var fetchAllClubNameUseCase: any FetchAllClubNameUseCase {
        shared {
            FetchAllClubNameUseCaseImpl(clubRepository: clubRepository)
        }
    }
}
