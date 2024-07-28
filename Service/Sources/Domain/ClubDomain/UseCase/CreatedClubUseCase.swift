import Foundation

public protocol CreatedClubUseCase {
    func callAsFunction(schoolID: Int, req: CreatedClubRequestDTO) async throws
}
