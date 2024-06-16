import Foundation

public struct FetchStudentDetailByClubUseCaseImpl: FetchStudentDetailByClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity {
        try await clubRepository.fetchStudentDetailByClub(clubID: clubID, studentID: studentID)
    }
}
