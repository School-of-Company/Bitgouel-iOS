import Foundation

public protocol CertificationRepository {
    func fetchCertificationListByTeacher(studentID: String) async throws -> [CertificationInfoEntity]
    func fetchCertificationListByStudent() async throws -> [CertificationInfoEntity]
    func inputCertification(req: InputCertificationRequestDTO) async throws
    func updateCertification(certificationID: String, req: InputCertificationRequestDTO) async throws
}
