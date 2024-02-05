import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubName: String
    public let highSchoolName: String
    public let studentHeadcount: Int
    
    init(
        clubName: String,
        highSchoolName: String,
        studentHeadcount: Int
    ) {
        self.clubName = clubName
        self.highSchoolName = highSchoolName
        self.studentHeadcount = studentHeadcount
    }
}

extension ClubDetailResponseDTO {
    func toDomain() -> ClubDetailEntity {
        ClubDetailEntity(
            clubName: clubName,
            highSchoolName: highSchoolName,
            studentHeadcount: studentHeadcount
        )
    }
}
