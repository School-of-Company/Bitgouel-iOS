import Foundation

public protocol ModifyUniversityUseCase {
    func callAsFunction(universityID: String, req: UniversityNameRequestDTO) async throws
}
