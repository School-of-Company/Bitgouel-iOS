import NeedleFoundation
import Service

extension AppComponent {
    var remoteFAQDataSource: any RemoteFAQDataSource {
        shared {
            RemoteFAQDataSourceImpl(keychain: keychain)
        }
    }

    var faqRepository: any FAQRepository {
        shared {
            FAQRepositoryImpl(remoteFAQDataSource: remoteFAQDataSource)
        }
    }

    var inputFAQUseCase: any InputFAQUseCase {
        shared {
            InputFAQUseCaseImpl(faqRepository: faqRepository)
        }
    }

    var fetchFAQListUseCase: any FetchFAQListUseCase {
        shared {
            FetchFAQListUseCaseImpl(faqRepository: faqRepository)
        }
    }
}
