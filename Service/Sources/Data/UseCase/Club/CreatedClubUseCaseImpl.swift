import Foundation

public struct CreatedClubUseCaseImpl: CreatedClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(schoolID: String, req: CreatedClubRequestDTO) async throws {
        try await clubRepository.createdClub(schoolID: schoolID, req: req)
    }
}
