import Foundation

public protocol SaveUserAuthorityUseCase {
    func callAsFunction(authority: UserAuthorityType)
}
