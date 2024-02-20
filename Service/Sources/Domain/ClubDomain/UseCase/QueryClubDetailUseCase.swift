import Foundation

public protocol QueryClubDetailUseCase {
    func callAsFunction(clubId: String) async throws -> ClubDetailEntity
}
