import Foundation

public struct DeleteUniversityUseCaseImpl: DeleteUniversityUseCase {
    private let universityRepository: any UniversityRepository

    public init(universityRepository: any UniversityRepository) {
        self.universityRepository = universityRepository
    }
    
    public func callAsFunction(universityID: String) async throws {
        try await universityRepository.deleteUniversity(universityID: universityID)
    }
}
