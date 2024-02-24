import Foundation

public struct QueryClubDatailUseCaseImpl: QueryClubDetailUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(clubID: String) async throws -> ClubDetailEntity {
        try await clubRepository.queryClubDetail(clubID: clubID)
    }
}
