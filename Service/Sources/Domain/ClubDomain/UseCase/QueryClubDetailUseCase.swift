import Foundation

public protocol QueryClubDetailUseCase {
    func callAsFunction(id: String) async throws -> ClubDetailEntity
}
