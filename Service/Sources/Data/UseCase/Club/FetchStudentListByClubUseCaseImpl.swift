import Foundation

public struct FetchStudentListByClubUseCaseImpl: FetchStudentListByClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction() async throws -> ClubDetailEntity {
        try await clubRepository.fetchStudentListByClub()
    }
}
