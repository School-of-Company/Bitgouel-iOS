import Foundation

public protocol FetchGovernmentListUseCase {
    func callAsFunction() async throws -> [GovernmentInfoEntity]
}
