import Foundation

public struct FetchEmailVerificationStatusResponseDTO: Decodable {
    public let isAuthentication: Bool

    public init(isAuthentication: Bool) {
        self.isAuthentication = isAuthentication
    }
}
