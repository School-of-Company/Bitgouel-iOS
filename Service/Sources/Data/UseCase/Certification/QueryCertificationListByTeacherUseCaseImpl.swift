import Foundation

public struct QueryCertificationListByTeacherUseCaseImpl: QueryCertificationListByTeacherUseCase {
    private let certificationRepository: any CertificationRepository
    
    public init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }
    
    public func callAsFunction(studentID: String) async throws -> [CertificationInfoEntity] {
        try await certificationRepository.queryCertificationListByTeacher(studentID: studentID)
    }
}
