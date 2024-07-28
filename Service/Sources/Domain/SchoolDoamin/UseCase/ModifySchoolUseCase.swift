import Foundation

public protocol ModifySchoolUseCase {
    func callAsFunction(schoolID: Int, req: ModifySchoolRequestDTO) async throws
}
