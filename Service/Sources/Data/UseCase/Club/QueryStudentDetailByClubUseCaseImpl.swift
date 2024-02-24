import Foundation

public struct QueryStudentDetailByClubUseCaseImpl: QueryStudentDetailByClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(clubID: String, studentID: String) async throws -> StudentDetailByClubEntity {
        try await clubRepository.queryStudentDetailByClub(clubID: clubID, studentID: studentID)
    }
}
