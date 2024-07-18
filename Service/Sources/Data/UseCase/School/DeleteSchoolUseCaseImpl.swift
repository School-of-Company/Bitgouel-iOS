import Foundation

public struct DeleteSchoolUseCaseImpl: DeleteSchoolUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func callAsFunction(schoolID: String) async throws {
        try await schoolRepository.deleteSchool(schoolID: schoolID)
    }
}