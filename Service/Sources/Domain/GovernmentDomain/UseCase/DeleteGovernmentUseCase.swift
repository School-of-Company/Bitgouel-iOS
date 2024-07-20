import Foundation

public protocol DeleteGovernmentUseCase {
    func callAsFunction(governmentID: Int) async throws
}
