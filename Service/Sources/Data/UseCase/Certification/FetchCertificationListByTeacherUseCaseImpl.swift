import Foundation

// swiftlint: disable type_name
public struct FetchCertificationListByTeacherUseCaseImpl: FetchCertificationListByTeacherUseCase {
    private let certificationRepository: any CertificationRepository

    public init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    public func callAsFunction(studentID: String) async throws -> [CertificationInfoEntity] {
        try await certificationRepository.fetchCertificationListByTeacher(studentID: studentID)
    }
}

// swiftlint: enable type_name
