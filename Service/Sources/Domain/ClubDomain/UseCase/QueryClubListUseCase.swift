import Foundation

public protocol QueryClubListUseCase {
    func callAsFunction(highSchool: String) async throws -> [ClubEntity]
}
