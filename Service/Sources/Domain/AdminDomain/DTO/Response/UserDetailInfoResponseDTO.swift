import Foundation

public struct UserDetailInfoResponseDTO: Decodable {
    public let userID: String
    public let name: String
    public let authority: UserAuthorityType
    public let approveStatus: ApproveStatusType
    
    public init(
        userID: String,
        name: String,
        authority: UserAuthorityType,
        approveStatus: ApproveStatusType
    ) {
        self.userID = userID
        self.name = name
        self.authority = authority
        self.approveStatus = approveStatus
    }
    
    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case name
        case authority
        case approveStatus
    }
}

extension UserDetailInfoResponseDTO {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            userID: userID,
            name: name,
            authority: authority,
            approveStatus: approveStatus
        )
    }
}
