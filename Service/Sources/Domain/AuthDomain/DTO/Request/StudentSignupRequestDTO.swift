import Foundation

public struct StudentSignupRequestDTO {
    public let email: String
    public let name: String
    public let phoneNumber: String
    public let password: String
    public let highSchool: HighSchoolType
    public let clubName: String
    public let grade: Int
    public let classRoom: Int
    public let number: Int
    public let admissionNumber: Int

    public init(
        email: String,
        name: String,
        phoneNumber: String,
        password: String,
        highSchool: HighSchoolType,
        clubName: String,
        grade: Int,
        classRoom: Int,
        number: Int,
        admissionNumber: Int
    ) {
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        self.highSchool = highSchool
        self.clubName = clubName
        self.grade = grade
        self.classRoom = classRoom
        self.number = number
        self.admissionNumber = admissionNumber
    }
}
