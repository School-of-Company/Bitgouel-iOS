import Foundation

public struct LocalAuthDataSourceImpl: LocalAuthDataSource {
    private enum UserDefaultsKey {
        static let userAuthority = "USER_ROLE"
        static let userID = ""
    }

    private let userDefaults: UserDefaults
    private let keychain: any Keychain

    public init(
        keychain: any Keychain,
        userDefaults: UserDefaults
    ) {
        self.keychain = keychain
        self.userDefaults = userDefaults
    }

    public func saveUserAuthority(authority: UserAuthorityType) {
        userDefaults.setValue(authority.rawValue, forKey: UserDefaultsKey.userAuthority)
    }

    public func saveUserID(id: String) {
        userDefaults.setValue(id, forKey: UserDefaultsKey.userID)
    }

    public func loadUserAuthority() -> UserAuthorityType {
        let userAuthority = userDefaults.string(forKey: UserDefaultsKey.userAuthority)
        if let userAuthority {
            return UserAuthorityType(rawValue: userAuthority) ?? .user
        } else { return .user }
    }

    public func loadUserID() -> String {
        let userID = userDefaults.string(forKey: UserDefaultsKey.userID)
        if let userID {
            return userID
        } else { return "" }
    }

    public func removeUserAuthority() {
        userDefaults.removeObject(forKey: UserDefaultsKey.userAuthority)
    }

    public func removeUserID() {
        userDefaults.removeObject(forKey: UserDefaultsKey.userID)
    }

    public func logout() {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessExpiredAt)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .refreshExpiredAt)
        removeUserAuthority()
        removeUserID()
    }

    public func withdraw() {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessExpiredAt)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .refreshExpiredAt)
        removeUserAuthority()
        removeUserID()
    }
}
