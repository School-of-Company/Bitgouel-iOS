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

    var lectureListInquirtyUseCase: any LectureListInquirtyUseCase {
        shared {
            LectureListInquirtyUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var lectureDetailInquiryUseCase: any LectureDetailInquiryUseCase {
        shared {
            LectureDetailInquiryUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var lectureApplyUseCase: any LectureApplyUseCase {
        shared {
            LectureApplyUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var waitingLectureApproveUseCase: any WaitingLectureApproveUseCase {
        shared {
            WaitingLectureApproveUseCaseImpl(lectureRepository: lectureRepository)
        }
    }

    var waitingLectureRejectUseCase: any WaitingLectureRejectUseCase {
        shared {
            WaitingLectureRejectUseCaseImpl(lectureRepository: lectureRepository)
        }
    }
}
