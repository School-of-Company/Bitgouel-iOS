import Foundation

public struct CreatedUniversityUseCaseImpl: CreatedUniversityUseCase {
    private let universityRepository: any UniversityRepository

    public init(universityRepository: any UniversityRepository) {
        self.universityRepository = universityRepository
    }

    public func callAsFunction(req: UniversityNameRequestDTO) async throws {
        try await universityRepository.createdUniversity(req: req)
    }
}
