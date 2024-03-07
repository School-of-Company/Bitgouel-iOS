import Foundation

public struct UserInfoResponseDTO: Decodable {
    public let users: [UserInfo]
    
    public init(users: [UserInfo]) {
        self.users = users
    }
    
    public struct UserInfo: Decodable {
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
}

extension UserInfoResponseDTO {
    func toDomain() -> [UserInfoEntity] {
        users.map { $0.toDomain() }
    }
}

extension UserInfoResponseDTO.UserInfo {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            userID: userID,
            name: name,
            authority: authority,
            approveStatus: approveStatus
        )
    }
}
