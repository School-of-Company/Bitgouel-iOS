import Foundation

struct QueryClubListUseCaseImpl: QueryClubListUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction() async throws -> ClubsEntity {
        try await clubRepository.queryClubList()
    }
}
