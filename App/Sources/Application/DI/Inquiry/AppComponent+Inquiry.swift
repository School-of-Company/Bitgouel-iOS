import NeedleFoundation
import Service

public extension AppComponent {
    var remoteInquiryDataSource: RemoteInquiryDataSource {
        shared {
            RemoteInquiryDataSourceImpl(keychain: keychain)
        }
    }

    var inquiryRepository: InquiryRepository {
        shared {
            InquiryRepositoryImpl(remoteInquiryDataSource: remoteInquiryDataSource)
        }
    }

    var inputInquiryUseCase: any InputInquiryUseCase {
        shared {
            InputInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase {
        shared {
            FetchMyInquiryListUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase {
        shared {
            FetchInquiryDetailUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var deleteMyInquiryUseCase: any DeleteMyInquiryUseCase {
        shared {
            DeleteMyInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var modifyMyInquiryUseCase: any ModifyMyInquiryUseCase {
        shared {
            ModifyMyInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var replyInquiryUseCase: any ReplyInquiryUseCase {
        shared {
            ReplyInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var fetchInquiryByAdminUseCase: any FetchInquiryByAdminUseCase {
        shared {
            FetchInquiryByAdminUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }

    var deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase {
        shared {
            DeleteInquiryByAdminUseCaseImpl(inquiryRepository: inquiryRepository)
        }
    }
}
