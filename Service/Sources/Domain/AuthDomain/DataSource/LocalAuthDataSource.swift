import Foundation

public protocol LocalAuthDataSource {
    func logout() async throws
    func withdraw() async throws
    func saveUserAuthority(authority: UserAuthorityType)
    func loadUserAuthority() -> UserAuthorityType
    func saveUserID(id: String)
    func loadUserID() -> String
}
