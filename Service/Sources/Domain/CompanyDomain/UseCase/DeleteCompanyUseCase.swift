import Foundation

public protocol DeleteCompanyUseCase {
    func callAsFunction(companyID: String) async throws
}
