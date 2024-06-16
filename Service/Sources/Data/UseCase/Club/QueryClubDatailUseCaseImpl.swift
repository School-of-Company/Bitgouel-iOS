import Foundation

public struct FetchClubDatailUseCaseImpl: FetchClubDetailUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(clubID: Int) async throws -> ClubDetailEntity {
        try await clubRepository.fetchClubDetail(clubID: clubID)
    }
}
