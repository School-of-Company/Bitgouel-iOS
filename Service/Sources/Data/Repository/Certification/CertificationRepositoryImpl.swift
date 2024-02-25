import Foundation

public struct CertificationRepositoryImpl: CertificationRepository {
    private let remoteCertificationDataSource: any RemoteCertificationDataSource
    
    public init(remoteCertificationDataSource: any RemoteCertificationDataSource) {
        self.remoteCertificationDataSource = remoteCertificationDataSource
    }
    
    public func queryCertificationListByTeacher(studentID: String) async throws -> [CertificationInfoEntity] {
        try await remoteCertificationDataSource.queryCertificationListByTeacher(studentID: studentID)
    }
    
    public func queryCertificationListByStudent() async throws -> [CertificationInfoEntity] {
        try await remoteCertificationDataSource.queryCertificationListByStudent()
    }
    
    public func inputCertification(req: InputCertificationRequestDTO) async throws {
        try await remoteCertificationDataSource.inputCertification(req: req)
    }
    
    public func updateCertification(certificationID: String, req: InputCertificationRequestDTO) async throws {
        try await remoteCertificationDataSource.updateCertification(certificationID: certificationID, req: req)
    }
}
