import Foundation

public protocol AuthRepository {
    func studentSignup(req: StudentSignupRequestDTO) async throws
}
