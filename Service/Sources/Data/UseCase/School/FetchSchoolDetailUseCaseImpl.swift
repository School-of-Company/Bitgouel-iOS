import Foundation

public struct FetchSchoolDetailUseCaseImpl: FetchSchoolDetailUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func callAsFunction(schoolID: Int) async throws -> SchoolListEntity {
        try await schoolRepository.fetchSchoolDetail(schoolID: schoolID)
    }
}
