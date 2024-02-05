import Foundation

struct QueryStudentListByClubUseCaseImpl: QueryStudentListByClubUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction() async throws -> [StudentEntity] {
        try await clubRepository.queryStudentListByClub()
    }
}
