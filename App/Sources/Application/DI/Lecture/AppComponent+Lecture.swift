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

    var cancelLectureApplicationUseCase: any CancelLectureApplicationUseCase {
        shared {
            CancelLectureApplicationUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchInstructorUseCase: any SearchInstructorUseCase {
        shared {
            SearchInstructorUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchLineUseCase: any SearchLineUseCase {
        shared {
            SearchLineUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchDepartmentUseCase: any SearchDepartmentUseCase {
        shared {
            SearchDepartmentUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var searchDivisionUseCase: any SearchDivisionUseCase {
        shared {
            SearchDivisionUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase {
        shared {
            FetchAppliedLectureListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchApplicantListUseCase: any FetchApplicantListUseCase {
        shared {
            FetchApplicantListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var setLectureCompletionUseCase: any SetLectureCompletionUseCase {
        shared {
            SetLectureCompletionUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var deleteLectureUseCase: any DeleteLectureUseCase {
        shared {
            DeleteLectureUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var modifyLectureUseCase: any ModifyLectureUseCase {
        shared {
            ModifyLectureUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var fetchAppliedLectureStudentDetailUseCase: any FetchAppliedLectureStudentDetailUseCase {
        shared {
            FetchAppliedLectureStudentDetailUseCaseImpl(lectureRepository: lectureRepository)
        }
    }
}
