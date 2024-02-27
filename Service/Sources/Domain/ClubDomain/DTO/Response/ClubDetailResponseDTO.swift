import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubName: String
    public let highSchoolName: String
    public let students: [memberInfoResponseDTO]
    public let teacher: memberInfoResponseDTO

    init(
        clubName: String,
        highSchoolName: String,
        students: [memberInfoResponseDTO],
        teacher: memberInfoResponseDTO
    ) {
        self.clubName = clubName
        self.highSchoolName = highSchoolName
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
