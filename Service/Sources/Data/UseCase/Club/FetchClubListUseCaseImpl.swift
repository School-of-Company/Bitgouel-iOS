import Foundation

public struct FetchClubListUseCaseImpl: FetchClubListUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(highSchool: String) async throws -> [ClubEntity] {
        try await clubRepository.fetchClubList(highSchool: highSchool)
    }
}
