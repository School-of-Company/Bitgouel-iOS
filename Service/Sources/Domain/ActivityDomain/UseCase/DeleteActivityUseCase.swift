import Foundation

public protocol DeleteActivityUseCase {
    func callAsFunction(activityID: String) async throws
}
