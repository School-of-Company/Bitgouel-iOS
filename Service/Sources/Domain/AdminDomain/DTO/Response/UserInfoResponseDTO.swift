import Foundation

public struct FetchUserInfoResponseDTO: Decodable {
    public let users: [UserInfoResponseDTO]

    public init(users: [UserInfoResponseDTO]) {
        self.users = users
    }
}

public struct UserInfoResponseDTO: Decodable {
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

extension FetchUserInfoResponseDTO {
    func toDomain() -> [UserInfoEntity] {
        users.map { $0.toDomain() }
    }
}

extension UserInfoResponseDTO {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            userID: userID,
            name: name,
            authority: authority,
            approveStatus: approveStatus
        )
    }
}
