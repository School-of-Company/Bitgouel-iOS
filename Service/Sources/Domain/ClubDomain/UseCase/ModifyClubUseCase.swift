import Foundation

public protocol ModifyClubUseCase {
    func callAsFunction(clubID: Int, req: InputClubRequestDTO) async throws
}
