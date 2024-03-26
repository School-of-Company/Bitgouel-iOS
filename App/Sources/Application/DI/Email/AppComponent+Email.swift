import NeedleFoundation
import Service

public extension AppComponent {
    var remoteEmailDataSource: any RemoteEmailDataSource {
        shared {
            RemoteEmailDataSourceImpl(keychain: keychain)
        }
    }
    
    var emailRepository: any EmailRepository {
        shared {
            EmailRepositoryImpl(remoteEmailDataSource: remoteEmailDataSource)
        }
    }
    
    var sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase {
        shared {
            SendEmailCertificationLinkUseCaseImpl(emailRepository: emailRepository)
        }
    }
    
    var fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase {
        shared {
            FetchEmailVerificationStatusUseCaseImpl(emailRepository: emailRepository)
        }
    }
}
