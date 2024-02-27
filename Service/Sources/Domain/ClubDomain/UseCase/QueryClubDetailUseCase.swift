import Foundation

public protocol QueryClubDetailUseCase {
    func callAsFunction(clubID: Int) async throws -> ClubDetailEntity
}
