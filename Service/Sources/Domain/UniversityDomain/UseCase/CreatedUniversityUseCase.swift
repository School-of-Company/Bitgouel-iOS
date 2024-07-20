import Foundation

public protocol CreatedUniversityUseCase {
    func callAsFunction(req: UniversityNameRequestDTO) async throws
}
