import Foundation

public protocol UpdateCertificationUseCase {
    func callAsFunction(certificationID: String, req: InputCertificationRequestDTO) async throws
}
