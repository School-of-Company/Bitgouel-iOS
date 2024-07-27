import Foundation

public protocol ModifyUniversityUseCase {
    func callAsFunction(universityID: Int, req: UniversityNameRequestDTO) async throws
}
