import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubID: Int
    public let clubName: String
    public let highSchoolName: String
    public let students: [MemberInfoResponseDTO]
    public let teacher: MemberInfoResponseDTO

    public init(
        clubID: Int,
        clubName: String,
        highSchoolName: String,
        students: [MemberInfoResponseDTO],
        teacher: MemberInfoResponseDTO
    ) {
        self.clubID = clubID
        self.clubName = clubName
        self.highSchoolName = highSchoolName
        self.students = students
        self.teacher = teacher
    }

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName
        case highSchoolName
        case students
        case teacher
    }
}

extension ClubDetailResponseDTO {
    func toDomain() -> ClubDetailEntity {
        ClubDetailEntity(
            clubID: clubID,
            clubName: clubName,
            highSchoolName: highSchoolName,
            students: students.map { $0.toDomain() },
            teacher: teacher.toDomain()
        )
    }
}

public struct MemberInfoResponseDTO: Decodable {
    public let studentID: String
    public let name: String

    public init(studentID: String, name: String) {
        self.studentID = studentID
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case studentID = "id"
        case name
    }
}

extension MemberInfoResponseDTO {
    func toDomain() -> ClubDetailEntity.MemberInfoEntity {
        ClubDetailEntity.MemberInfoEntity(
            studentID: studentID,
            name: name
        )
    }
}
