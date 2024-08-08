import Foundation

public struct ModifySchoolUseCaseImpl: ModifySchoolUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func callAsFunction(schoolID: Int, logoImage: Data, req: InputSchoolInfoRequestDTO) async throws {
        try await schoolRepository.modifySchool(schoolID: schoolID, logoImage: logoImage, req: req)
    }
}
