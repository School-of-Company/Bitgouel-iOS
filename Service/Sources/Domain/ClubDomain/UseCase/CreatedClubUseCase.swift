import Foundation

public protocol CreatedClubUseCase {
    func callAsFunction(schoolID: String, req: CreatedClubRequestDTO) async throws
}
