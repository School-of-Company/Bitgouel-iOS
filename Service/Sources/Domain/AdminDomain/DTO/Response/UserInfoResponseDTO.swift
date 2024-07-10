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
    public let phoneNumber: String
    public let subscriptionYear: Int
    public let subscriptionGrade: Int?
    public let email: String

    public init(
        userID: String,
        name: String,
        authority: UserAuthorityType,
        approveStatus: ApproveStatusType,
        phoneNumber: String,
        subscriptionYear: Int,
        subscriptionGrade: Int?,
        email: String
    ) {
        self.userID = userID
        self.name = name
        self.authority = authority
        self.approveStatus = approveStatus
        self.phoneNumber = phoneNumber
        self.subscriptionYear = subscriptionYear
        self.subscriptionGrade = subscriptionGrade
        self.email = email
    }

    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case name
        case authority
        case approveStatus
        case phoneNumber
        case subscriptionYear
        case subscriptionGrade
        case email
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
            approveStatus: approveStatus,
            phoneNumber: phoneNumber,
            subscriptionYear: subscriptionYear,
            subscriptionGrade: subscriptionGrade,
            email: email
        )
    }
}
