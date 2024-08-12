import Foundation

public struct FetchAllClubNameUseCaseImpl: FetchAllClubNameUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(schoolName: String) async throws -> [String] {
        try await clubRepository.fetchAllClubName(schoolName: schoolName)
    }
}
