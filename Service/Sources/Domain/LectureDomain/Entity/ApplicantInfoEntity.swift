import Foundation

public struct ApplicantInfoEntity: Equatable {
    public let studentID: String
    public let name: String
    public let grade: Int
    public let classNumber: Int
    public let number: Int
    public let school: String
    public let clubName: String
    public var isComplete: Bool

    public init(
        studentID: String,
        name: String,
        grade: Int,
        classNumber: Int,
        number: Int,
        school: String,
        clubName: String,
        isComplete: Bool
    ) {
        self.studentID = studentID
        self.name = name
        self.grade = grade
        self.classNumber = classNumber
        self.number = number
        self.school = school
        self.clubName = clubName
        self.isComplete = isComplete
    }
}
