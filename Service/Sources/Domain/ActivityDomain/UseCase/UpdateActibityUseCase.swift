import Foundation

public protocol UpdateActibityUseCase {
    func callAsFunction(activityID: String, req: InputActivityRequestDTO) async throws
}
