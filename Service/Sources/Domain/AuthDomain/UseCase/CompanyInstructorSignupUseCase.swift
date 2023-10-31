import Foundation

public protocol CompanyInstructorSignupUseCase {
    func callAsFunction(req: CompanyInstructorSignupRequestDTO) async throws
}
