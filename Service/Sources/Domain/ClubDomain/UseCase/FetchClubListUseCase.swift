import Foundation

public protocol FetchClubListUseCase {
    func callAsFunction(highSchool: String) async throws -> [ClubEntity]
}
