import Foundation

public protocol ModifyActivityUseCase {
    func callAsFunction(activityID: String, req: InputActivityRequestDTO) async throws
}
