import Foundation

public protocol DeleteCompanyUseCase {
    func callAsFunction(companyID: Int) async throws
}
