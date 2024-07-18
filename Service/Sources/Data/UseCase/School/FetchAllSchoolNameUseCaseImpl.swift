import Foundation

public struct FetchAllSchoolNameUseCaseImpl: FetchAllSchoolNameUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func callAsFunction() async throws -> [String] {
        try await schoolRepository.fetchAllSchoolName()
    }
}
