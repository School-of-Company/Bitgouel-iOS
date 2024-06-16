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

    var fetchCertificationListByTeacherUseCase: any FetchCertificationListByTeacherUseCase {
        shared {
            FetchCertificationListByTeacherUseCaseImpl(certificationRepository: certificationRepository)
        }
    }

    var fetchCertificationListByStudentUseCase: any FetchCertificationListByStudentUseCase {
        shared {
            FetchCertificationListByStudentUseCaseImpl(certificationRepository: certificationRepository)
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
