import Foundation

public protocol ModifySchoolUseCase {
    func callAsFunction(schoolID: String, req: ModifySchoolRequestDTO) async throws
}
