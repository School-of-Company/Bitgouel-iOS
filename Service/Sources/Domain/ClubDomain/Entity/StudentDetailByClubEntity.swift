import Foundation

public struct StudentDetailByClubEntity: Equatable {
    public let name: String
    public let phoneNumber: String
    public let email: String
    public let credit: Int

    public init(
        name: String,
        phoneNumber: String,
        email: String,
        credit: Int
    ) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.credit = credit
    }
}
