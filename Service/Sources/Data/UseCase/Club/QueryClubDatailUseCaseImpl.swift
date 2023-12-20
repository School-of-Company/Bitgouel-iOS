import Foundation

struct QueryClubDatailUseCaseImpl: QueryClubDetailUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction(id: String) async throws -> ClubDetailEntity {
        try await clubRepository.queryClubDetail(id: id)
    }
}
