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

    var fetchInstructorListUseCase: any FetchInstructorListUseCase {
        shared {
            FetchInstructorListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchLineListUseCase: any FetchLineListUseCase {
        shared {
            FetchLineListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchDepartmentListUseCase: any FetchDepartmentListUseCase {
        shared {
            FetchDepartmentListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchDivisionListUseCase: any FetchDivisionListUseCase {
        shared {
            FetchDivisionListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase {
        shared {
            FetchAppliedLectureListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }
}
