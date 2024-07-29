import Foundation

public struct ModifyUniversityUseCaseImpl: ModifyUniversityUseCase {
    private let universityRepository: any UniversityRepository

    public init(universityRepository: any UniversityRepository) {
        self.universityRepository = universityRepository
    }

    public func callAsFunction(universityID: Int, req: UniversityNameRequestDTO) async throws {
        try await universityRepository.modifyUniversity(universityID: universityID, req: req)
    }
}
