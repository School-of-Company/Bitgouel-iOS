import Foundation

public struct QueryStudentDetailByClubUseCaseImpl: QueryStudentDetailByClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(id: String, studentId: String) async throws -> StudentDetailByClubEntity {
        try await clubRepository.queryStudentDetailByClub(id: id, studentId: studentId)
    }
}
