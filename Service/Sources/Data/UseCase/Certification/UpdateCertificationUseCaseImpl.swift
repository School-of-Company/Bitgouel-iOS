import Foundation

public struct UpdateCertificationUseCaseImpl: UpdateCertificationUseCase {
    private let certificationRepository: any CertificationRepository
    
    public init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }
    
    public func callAsFunction(certificationID: String, req: InputCertificationRequestDTO) async throws {
        try await certificationRepository.updateCertification(certificationID: certificationID, req: req)
    }
}
