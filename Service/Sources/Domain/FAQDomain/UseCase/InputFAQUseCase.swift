import Foundation

public protocol InputFAQUseCase {
    func callAsFunction(req: InputFAQRequestDTO) async throws
}
