import Foundation

public struct FetchEmailVerificationStatusEntity: Equatable {
    public let isAuthentication: Bool

    public init(isAuthentication: Bool) {
        self.isAuthentication = isAuthentication
    }
}
