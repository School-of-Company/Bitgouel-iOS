import Foundation

struct QueryStudentListByClubUseCaseImpl: QueryStudentListByClubUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction(id: String) async throws -> StudentsEntity {
        try await clubRepository.queryStudentListByClub(id: id)
    }
}
