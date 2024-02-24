import Foundation

public protocol QueryCertificationListByStudentUseCase {
    func callAsFunction() async throws -> [CertificationInfoEntity]
}
