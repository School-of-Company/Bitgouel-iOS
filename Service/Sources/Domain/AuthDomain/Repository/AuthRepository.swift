import Foundation

public protocol AuthRepository {
    func login(req: LoginRequestDTO) async throws
    func reissueToken() async throws
    func logout() async throws
    func withdraw() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
}
