import Foundation

public struct QueryCertificationListByStudentUseCaseImpl: QueryCertificationListByStudentUseCase {
    private let certificationRepository: any CertificationRepository
    
    public init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }
    
    public func callAsFunction() async throws -> [CertificationInfoEntity] {
        try await certificationRepository.queryCertificationListByStudent()
    }
}
