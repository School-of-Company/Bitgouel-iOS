import Foundation

public struct CertificationRepositoryImpl: CertificationRepository {
    private let remoteCertificationDataSource: any RemoteCertificationDataSource

    public init(remoteCertificationDataSource: any RemoteCertificationDataSource) {
        self.remoteCertificationDataSource = remoteCertificationDataSource
    }

    public func fetchCertificationListByTeacher(studentID: String) async throws -> [CertificationInfoEntity] {
        try await remoteCertificationDataSource.fetchCertificationListByTeacher(studentID: studentID)
    }

    public func fetchCertificationListByStudent() async throws -> [CertificationInfoEntity] {
        try await remoteCertificationDataSource.fetchCertificationListByStudent()
    }

    public func inputCertification(req: InputCertificationRequestDTO) async throws {
        try await remoteCertificationDataSource.inputCertification(req: req)
    }

    public func updateCertification(certificationID: String, req: InputCertificationRequestDTO) async throws {
        try await remoteCertificationDataSource.updateCertification(certificationID: certificationID, req: req)
    }
}
