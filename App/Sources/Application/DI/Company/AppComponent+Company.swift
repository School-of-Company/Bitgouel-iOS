import NeedleFoundation
import Service

public extension AppComponent {
    var remoteCompanyDataSource: any RemoteCompanyDataSource {
        shared {
            RemoteCompanyDataSourceImpl(keychain: keychain)
        }
    }

    var companyRepository: any CompanyRepository {
        shared {
            CompanyRepositoryImpl(remoteCompanyDataSource: remoteCompanyDataSource)
        }
    }

    var fetchCompanyListUseCase: any FetchCompanyListUseCase {
        FetchCompanyListUseCaseImpl(companyRepository: companyRepository)
    }

    var createdCompanyUseCase: any CreatedCompanyUseCase {
        CreatedCompanyUseCaseImpl(companyRepository: companyRepository)
    }

    var deleteCompanyUseCase: any DeleteCompanyUseCase {
        DeleteCompanyUseCaseImpl(companyRepository: companyRepository)
    }
}
