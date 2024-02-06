import Foundation

public struct ChangePasswordRequestDTO: Encodable {
    public let currentPassword: String
    public let newPassword: String

    public init(
        currentPassword: String,
        newPassword: String
    ) {
        self.currentPassword = currentPassword
        self.newPassword = newPassword
    }
}
