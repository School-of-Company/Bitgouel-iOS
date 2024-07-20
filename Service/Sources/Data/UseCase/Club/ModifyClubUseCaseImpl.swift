import Foundation

public struct ModifyClubUseCaseImpl: ModifyClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(clubID: Int, req: ModifyClubRequestDTO) async throws {
        try await clubRepository.modifyClub(clubID: clubID, req: req)
    }
}
