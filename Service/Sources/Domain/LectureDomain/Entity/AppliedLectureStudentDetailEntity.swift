import Foundation

public struct AppliedLectureStudentDetailEntity: Equatable {
    public let email: String
    public let name: String
    public let grade: Int
    public let classNumber: Int
    public let number: Int
    public let phoneNumber: String
    public let school: String
    public let clubName: String
    public let cohort: Int
    public let currentCompletedDate: Date
    public let completeStatus: CompleteStatusType

    public init(
        email: String,
        name: String,
        grade: Int,
        classNumber: Int,
        number: Int,
        phoneNumber: String,
        school: String,
        clubName: String,
        cohort: Int,
        currentCompletedDate: Date,
        completeStatus: CompleteStatusType
    ) {
        self.email = email
        self.name = name
        self.grade = grade
        self.classNumber = classNumber
        self.number = number
        self.phoneNumber = phoneNumber
        self.school = school
        self.clubName = clubName
        self.cohort = cohort
        self.currentCompletedDate = currentCompletedDate
        self.completeStatus = completeStatus
    }
}
