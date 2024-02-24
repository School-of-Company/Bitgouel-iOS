import Foundation

public protocol InputCertificationUseCase {
    func callAsFunction(req: InputCertificationRequestDTO) async throws
}
