import Foundation

public protocol FetchCertificationListByTeacherUseCase {
    func callAsFunction(studentID: String) async throws -> [CertificationInfoEntity]
}
