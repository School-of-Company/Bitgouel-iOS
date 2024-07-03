import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubID: Int
    public let clubName: String
    public let schoolName: String
    public let students: [MemberInfoResponseDTO]
    public let teacher: TeacherInfoResponseDTO

    public init(
        clubID: Int,
        clubName: String,
        schoolName: String,
        students: [MemberInfoResponseDTO],
        teacher: TeacherInfoResponseDTO
    ) {
        self.clubID = clubID
        self.clubName = clubName
        self.schoolName = schoolName
        self.students = students
        self.teacher = teacher
    }

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName
        case schoolName
        case students
        case teacher
    }
}

extension ClubDetailResponseDTO {
    func toDomain() -> ClubDetailEntity {
        ClubDetailEntity(
            clubID: clubID,
            clubName: clubName,
            schoolName: schoolName,
            students: students.map { $0.toDomain() },
            teacher: teacher.toDomain()
        )
    }
}

public struct MemberInfoResponseDTO: Decodable {
    public let userID: String
    public let studentID: String
    public let name: String

    public init(
        userID: String,
        studentID: String,
        name: String
    ) {
        self.userID = userID
        self.studentID = studentID
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case studentID = "id"
        case name
    }
}

public struct TeacherInfoResponseDTO: Decodable {
    public let teacherID: String
    public let name: String

    public init(
        teacherID: String,
        name: String
    ) {
        self.teacherID = teacherID
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case teacherID = "id"
        case name
    }
}

extension MemberInfoResponseDTO {
    func toDomain() -> ClubDetailEntity.MemberInfoEntity {
        ClubDetailEntity.MemberInfoEntity(
            userID: userID,
            studentID: studentID,
            name: name
        )
    }
}

extension TeacherInfoResponseDTO {
    func toDomain() -> ClubDetailEntity.TeacherInfoEntity {
        ClubDetailEntity.TeacherInfoEntity(
            teacherID: teacherID,
            name: name
        )
    }
}
