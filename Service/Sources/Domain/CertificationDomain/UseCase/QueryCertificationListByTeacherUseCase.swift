import Foundation

public protocol QueryCertificationListByTeacherUseCase {
    func callAsFunction(studentID: String) async throws -> [CertificationInfoEntity]
}
