import Foundation

public protocol CertificationRepository {
    func queryCertificationListByTeacher(studentID: String) async throws -> [CertificationInfoEntity]
    func queryCertificationListByStudent() async throws -> [CertificationInfoEntity]
    func inputCertification(req: InputCertificationRequestDTO) async throws
    func updateCertification(certificationID: String, req: InputCertificationRequestDTO) async throws
}
