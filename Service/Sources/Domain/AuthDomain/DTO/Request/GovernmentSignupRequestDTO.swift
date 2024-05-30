import Foundation

public struct GovernmentSignupRequestDTO: Encodable {
    public let email: String
    public let name: String
    public let phoneNumber: String
    public let password: String
    public let highSchool: HighSchoolType
    public let clubName: String
    public let governmentName: String
    public let position: String
    public let sectors: String

    public init(
        email: String,
        name: String,
        phoneNumber: String,
        password: String,
        highSchool: HighSchoolType,
        clubName: String,
        governmentName: String,
        position: String,
        sectors: String
    ) {
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        self.highSchool = highSchool
        self.clubName = clubName
        self.governmentName = governmentName
        self.position = position
        self.sectors = sectors
    }
}
