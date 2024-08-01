import Foundation

public protocol CreatedClubUseCase {
    func callAsFunction(schoolID: Int, req: InputClubRequestDTO) async throws
}
