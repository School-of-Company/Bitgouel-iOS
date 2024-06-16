import Foundation

// swiftlint: disable type_name
public struct FetchCertificationListByStudentUseCaseImpl: FetchCertificationListByStudentUseCase {
    private let certificationRepository: any CertificationRepository

    public init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    public func callAsFunction() async throws -> [CertificationInfoEntity] {
        try await certificationRepository.fetchCertificationListByStudent()
    }
}

// swiftlint: enable type_name
