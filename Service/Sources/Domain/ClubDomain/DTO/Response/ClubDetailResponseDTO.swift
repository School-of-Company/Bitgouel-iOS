import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubID: Int
    public let clubName: String
    public let highSchoolName: String
    public let students: [memberInfoResponseDTO]
    public let teacher: memberInfoResponseDTO

    init(
        clubID: Int,
        clubName: String,
        highSchoolName: String,
        students: [memberInfoResponseDTO],
        teacher: memberInfoResponseDTO
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
            clubID: clubID,
            clubName: clubName,
            highSchoolName: highSchoolName,
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
