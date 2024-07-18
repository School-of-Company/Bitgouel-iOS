import Foundation

public struct FetchUniversityListUseCaseImpl: FetchUniversityListUseCase {
    private let universityRepository: any UniversityRepository

    public init(universityRepository: any UniversityRepository) {
        self.universityRepository = universityRepository
    }
    
    public func callAsFunction() async throws -> [UniversityInfoEntity] {
        try await universityRepository.fetchUniversityList()
    }
}
