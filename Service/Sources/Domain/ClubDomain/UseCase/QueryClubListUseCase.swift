import Foundation

public protocol QueryClubListUseCase {
    func callAsFunction() async throws -> [ClubEntity]
}
