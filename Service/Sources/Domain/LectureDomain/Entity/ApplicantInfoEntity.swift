import Foundation

public struct ApplicantInfoEntity: Equatable {
    public let studentID: String
    public let email: String
    public let name: String
    public let grade: Int
    public let classNumber: Int
    public let number: Int
    public let phoneNumber: String
    public let school: HighSchoolType
    public let clubName: String
    public let cohort: Int
    public let isComplete: Bool

    public init(
        studentID: String,
        email: String,
        name: String,
        grade: Int,
        classNumber: Int,
        number: Int,
        phoneNumber: String,
        school: HighSchoolType,
        clubName: String,
        cohort: Int,
        isComplete: Bool
    ) {
        self.studentID = studentID
        self.email = email
        self.name = name
        self.grade = grade
        self.classNumber = classNumber
        self.number = number
        self.phoneNumber = phoneNumber
        self.school = school
        self.clubName = clubName
        self.cohort = cohort
        self.isComplete = isComplete
    }
}
