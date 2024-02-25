import NeedleFoundation
import Service

public extension AppComponent {
    var remoteCertificationDataSource: any RemoteCertificationDataSource {
        shared {
            RemoteCertificationDataSourceImpl(keychain: keychain)
        }
    }

    var certificationRepository: any CertificationRepository {
        shared {
            CertificationRepositoryImpl(remoteCertificationDataSource: remoteCertificationDataSource)
        }
    }

    var queryCertificationListByTeacherUseCase: any QueryCertificationListByTeacherUseCase {
        shared {
            QueryCertificationListByTeacherUseCaseImpl(certificationRepository: certificationRepository)
        }
    }

    var queryCertificationListByStudentUseCase: any QueryCertificationListByStudentUseCase {
        shared {
            QueryCertificationListByStudentUseCaseImpl(certificationRepository: certificationRepository)
        }
    }

    var inputCertificationUseCase: any InputCertificationUseCase {
        shared {
            InputCertificationUseCaseImpl(certificationRepository: certificationRepository)
        }
    }

    var updateCertificationUseCase: any UpdateCertificationUseCase {
        shared {
            UpdateCertificationUseCaseImpl(certificationRepository: certificationRepository)
        }
    }
}
