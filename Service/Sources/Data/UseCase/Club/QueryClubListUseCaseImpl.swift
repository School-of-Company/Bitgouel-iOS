import Foundation

public struct QueryClubListUseCaseImpl: QueryClubListUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(highSchool: String) async throws -> [ClubEntity] {
        try await clubRepository.queryClubList(highSchool: highSchool)
    }
}
