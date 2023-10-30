import Foundation

public protocol AuthRepository {
    func logout() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
}
