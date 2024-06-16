import Foundation

public final class RemoteCertificationDataSourceImpl: BaseRemoteDataSource<CertificationAPI>,
    RemoteCertificationDataSource {
    public func fetchCertificationListByTeacher(studentID: String) async throws -> [CertificationInfoEntity] {
        try await request(
            .fetchCertificationListByTeacher(studentID: studentID),
            dto: CertificationListResponseDTO.self
        ).toDomain()
    }

    public func fetchCertificationListByStudent() async throws -> [CertificationInfoEntity] {
        try await request(.fetchCertificationListByStudent, dto: CertificationListResponseDTO.self).toDomain()
    }

    public func inputCertification(req: InputCertificationRequestDTO) async throws {
        try await request(.inputCertification(req: req))
    }

    public func updateCertification(certificationID: String, req: InputCertificationRequestDTO) async throws {
        try await request(.updateCertification(certificationID: certificationID, req: req))
    }
}
