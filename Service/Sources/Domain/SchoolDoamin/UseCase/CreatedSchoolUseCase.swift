import Foundation

public protocol CreatedSchoolUseCase {
    func callAsFunction(req: CreatedSchoolRequestDTO) async throws
}
