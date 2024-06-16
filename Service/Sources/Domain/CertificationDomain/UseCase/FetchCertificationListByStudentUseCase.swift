import Foundation

public protocol FetchCertificationListByStudentUseCase {
    func callAsFunction() async throws -> [CertificationInfoEntity]
}
