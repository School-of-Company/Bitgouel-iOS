import Foundation

public struct CreatedClubUseCaseImpl: CreatedClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(schoolID: Int, req: InputClubRequestDTO) async throws {
        try await clubRepository.createdClub(schoolID: schoolID, req: req)
    }
}
