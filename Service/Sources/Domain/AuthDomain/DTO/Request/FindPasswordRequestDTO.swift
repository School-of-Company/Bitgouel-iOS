import Foundation

public struct FindPasswordRequestDTO: Encodable {
    public let email: String
    public let newPassword: String

    public init(
        email: String,
        newPassword: String
    ) {
        self.email = email
        self.newPassword = newPassword
    }
}
