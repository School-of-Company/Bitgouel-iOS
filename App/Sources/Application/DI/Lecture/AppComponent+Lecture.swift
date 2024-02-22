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

    var lectureOpenUseCase: any LectureOpenUseCase {
        shared {
            LectureOpenUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var queryLectureListUseCase: any QueryLectureListUseCase {
        shared {
            QueryLectureListUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var queryLectureDetailUseCase: any QueryLectureDetailUseCase {
        shared {
            QueryLectureDetailUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var lectureApplyUseCase: any LectureApplyUseCase {
        shared {
            LectureApplyUseCaseImpl(lectureRepository: lectureRepository)
        }
    }
    
    var lectureCancelUseCase: any LectureCancelUseCase {
        shared {
            LectureCancelUseCaseImpl(lectureRepository: lectureRepository)
        }
    }
}
