import Foundation

public struct InputCertificationUseCaseImpl: InputCertificationUseCase {
    private let certificationRepository: any CertificationRepository

    public init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    public func callAsFunction(req: InputCertificationRequestDTO) async throws {
        try await certificationRepository.inputCertification(req: req)
    }
}
