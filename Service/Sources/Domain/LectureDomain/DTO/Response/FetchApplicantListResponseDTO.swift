import Foundation

public struct FetchApplicantListResponseDTO: Decodable {
    public let students: [ApplicantInfoResponseDTO]

    public init(students: [ApplicantInfoResponseDTO]) {
        self.students = students
    }
}

public struct ApplicantInfoResponseDTO: Decodable {
    public let studentID: String
    public let name: String
    public let grade: Int
    public let classNumber: Int
    public let number: Int
    public let school: String
    public let clubName: String
    public let isComplete: Bool

    enum CodingKeys: String, CodingKey {
        case studentID = "id"
        case name
        case grade
        case classNumber
        case number
        case school
        case clubName
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
            name: name,
            grade: grade,
            classNumber: classNumber,
            number: number,
            school: school,
            clubName: clubName,
            isComplete: isComplete
        )
    }
}
