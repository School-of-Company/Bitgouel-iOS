import Foundation

public struct FetchSchoolListUseCaseImpl: FetchSchoolListUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func callAsFunction() async throws -> [SchoolListEntity] {
        try await schoolRepository.fetchSchoolList()
    }
}
