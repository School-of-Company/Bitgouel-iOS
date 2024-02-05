import Foundation

public struct QueryClubDatailUseCaseImpl: QueryClubDetailUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(id: String) async throws -> ClubDetailEntity {
        try await clubRepository.queryClubDetail(id: id)
    }
}
