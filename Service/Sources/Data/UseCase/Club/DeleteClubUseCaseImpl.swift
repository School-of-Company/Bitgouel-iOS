import Foundation

public struct DeleteClubUseCaseImpl: DeleteClubUseCase {
    private let clubRepository: any ClubRepository

    public init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    public func callAsFunction(clubID: Int) async throws {
        try await clubRepository.deleteClub(clubID: clubID)
    }
}
