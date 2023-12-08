import Foundation

public protocol LocalAuthDataSource {
    func logout() async throws
    func withdraw() async throws
}
