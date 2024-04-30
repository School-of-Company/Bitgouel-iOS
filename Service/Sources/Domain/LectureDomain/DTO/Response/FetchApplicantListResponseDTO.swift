import Foundation

public struct FetchApplicantListResponseDTO: Decodable {
    public let students: [ApplicantInfoResponseDTO]

    public init(students: [ApplicantInfoResponseDTO]) {
        self.students = students
    }
}

public struct ApplicantInfoResponseDTO: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case studentID = "id"
        case email
        case name
        case grade
        case classNumber
        case number
        case phoneNumber
        case school
        case clubName
        case cohort
        case isComplete
    }
}

extension FetchApplicantListResponseDTO {
    func toDomain() -> [ApplicantInfoEntity] {
        students.map { $0.toDomain() }
    }
}

extension ApplicantInfoResponseDTO {
    func toDomain() -> ApplicantInfoEntity {
        ApplicantInfoEntity(
            studentID: studentID,
            email: email,
            name: name,
            grade: grade,
            classNumber: classNumber,
            number: number,
            phoneNumber: phoneNumber,
            school: school,
            clubName: clubName,
            cohort: cohort,
            isComplete: isComplete
        )
    }
}
