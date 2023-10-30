import Foundation

public protocol AuthRepository {
  
    func login(req: LoginRequestDTO) async throws
    func logout() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
}
