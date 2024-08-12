import Foundation

public struct TeacherSignupRequestDTO: Encodable {
    public let email: String
    public let name: String
    public let phoneNumber: String
    public let password: String
    public let highSchool: String
    public let clubName: String

    public init(
        email: String,
        name: String,
        phoneNumber: String,
        password: String,
        highSchool: String,
        clubName: String
    ) {
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        self.highSchool = highSchool
        self.clubName = clubName
    }
}
