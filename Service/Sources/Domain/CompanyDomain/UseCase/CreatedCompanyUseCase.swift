import Foundation

public protocol CreatedCompanyUseCase {
    func callAsFunction(req: CreatedCompanyRequestDTO) async throws
}
