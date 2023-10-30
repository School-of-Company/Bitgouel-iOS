import Foundation

public protocol AuthRepository {
    func reissueToken() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
}
