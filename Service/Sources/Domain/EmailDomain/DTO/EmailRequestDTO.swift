import Foundation

public struct EmailRequestDTO: Encodable {
    public let email: String

    public init(email: String) {
        self.email = email
    }
}
