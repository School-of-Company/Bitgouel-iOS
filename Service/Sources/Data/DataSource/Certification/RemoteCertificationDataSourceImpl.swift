import Foundation

public final class RemoteCertificationDataSourceImpl: BaseRemoteDataSource<CertificationAPI>, RemoteCertificationDataSource {
    public func queryCertificationListByTeacher(studentID: String) async throws -> [CertificationInfoEntity] {
        try await request(.queryCertificationListByTeacher(studentID: studentID), dto: CertificationListResponseDTO.self).toDomain()
    }

    public func queryCertificationListByStudent() async throws -> [CertificationInfoEntity] {
        try await request(.queryCertificationListByStudent, dto: CertificationListResponseDTO.self).toDomain()
    }

    public func inputCertification(req: InputCertificationRequestDTO) async throws {
        try await request(.inputCertification(req: req))
    }

    public func updateCertification(certificationID: String, req: InputCertificationRequestDTO) async throws {
        try await request(.updateCertification(certificationID: certificationID, req: req))
    }
}
