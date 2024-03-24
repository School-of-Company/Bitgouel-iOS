import Foundation

public struct EmailVerificationStatusEntity: Equatable {
    public let isAuthentication: Bool

    public init(isAuthentication: Bool) {
        self.isAuthentication = isAuthentication
    }
}
