import Foundation

public protocol QueryClubDetailUseCase {
    func callAsFunction(clubID: String) async throws -> ClubDetailEntity
}
