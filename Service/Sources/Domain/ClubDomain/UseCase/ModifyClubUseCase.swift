import Foundation

public protocol ModifyClubUseCase {
    func callAsFunction(clubID: Int, req: ModifyClubRequestDTO) async throws
}
