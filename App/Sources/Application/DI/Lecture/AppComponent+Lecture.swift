import NeedleFoundation
import Service

public extension AppComponent {
    var remoteLectureDataSource: any RemoteLectureDataSource {
        shared {
            RemoteLectureDataSourceImpl(keychain: keychain)
        }
    }

    var lectureRepository: any LectureRepository {
        shared {
            LectureRepositoryImpl(remoteLectureDataSource: remoteLectureDataSource)
        }
    }

    var openLectureUseCase: any OpenLectureUseCase {
        shared {
            OpenLectureUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchLectureListUseCase: any FetchLectureListUseCase {
        shared {
            FetchLectureListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase {
        shared {
            FetchLectureDetailUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var applyLectureUseCase: any ApplyLectureUseCase {
        shared {
            ApplyLectureUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var cancelLectureUseCase: any CancelLectureUseCase {
        shared {
            CancelLectureUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchInstructorListUseCase: any SearchInstructorListUseCase {
        shared {
            SearchInstructorListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchDivisionListUseCase: any SearchDivisionListUseCase {
        shared {
            SearchDivisionListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchDepartmentListUseCase: any SearchDepartmentListUseCase {
        shared {
            SearchDepartmentListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }
}
