import Foundation

public protocol ModifySchoolUseCase {
    func callAsFunction(schoolID: Int, logoImage: Data, req: InputSchoolInfoRequestDTO) async throws
}
