import Foundation

public protocol InputCertificationUseCase {
    func callAsFunction(req: InputPostRequestDTO) async throws
}
