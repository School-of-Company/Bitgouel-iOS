import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubId: String
    public let clubName: String
    public let highSchoolName: String
    public let headcount: Int
    public let students: [memberInfoResponseDTO]
    public let teacher: memberInfoResponseDTO

    init(
        clubId: String,
        clubName: String,
        highSchoolName: String,
        headcount: Int,
        students: [memberInfoResponseDTO],
        teacher: memberInfoResponseDTO
    ) {
        self.clubId = clubId
        self.clubName = clubName
        self.highSchoolName = highSchoolName
        self.headcount = headcount
        self.students = students
        self.teacher = teacher
    }

    public struct memberInfoResponseDTO: Decodable {
        public let id: String
        public let name: String

        init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension ClubDetailResponseDTO {
    func toDomain() -> ClubDetailEntity {
        ClubDetailEntity(
            clubId: clubId,
            clubName: clubName,
            highSchoolName: highSchoolName,
            headcount: headcount,
            students: students.map { $0.toDomain() },
            teacher: teacher.toDomain()
        )
    }
}

extension ClubDetailResponseDTO.memberInfoResponseDTO {
    func toDomain() -> ClubDetailEntity.memberInfoEntity {
        ClubDetailEntity.memberInfoEntity(id: id, name: name)
    }
}
