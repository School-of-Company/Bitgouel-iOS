import Foundation

public protocol CreatedSchoolUseCase {
    func callAsFunction(logoImage: Data, req: InputSchoolInfoRequestDTO) async throws
}
