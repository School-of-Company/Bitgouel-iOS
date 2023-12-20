import Foundation

public struct ClubDetailResponseDTO: Decodable {
    public let clubName: String
    public let highSchoolName: String
    public let studentHeadcount: Int
}
