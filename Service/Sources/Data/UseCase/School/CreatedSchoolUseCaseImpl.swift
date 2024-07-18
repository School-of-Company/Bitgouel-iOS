import Foundation

public struct CreatedSchoolUseCaseImpl: CreatedSchoolUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func callAsFunction(req: CreatedSchoolRequestDTO) async throws {
        try await schoolRepository.createdSchool(req: req)
    }
}
