import Foundation

public struct FetchWithdrawUserListResponseDTO: Decodable {
    public let students: [WithdrawUserInfoResponseDTO]

    public init(students: [WithdrawUserInfoResponseDTO]) {
        self.students = students
    }
}

public struct WithdrawUserInfoResponseDTO: Decodable {
    public let withdrawID: Int
    public let userID: String
    public let name: String
    public let email: String
    public let phoneNumber: String

    public init(
        withdrawID: Int,
        userID: String,
        name: String,
        email: String,
        phoneNumber: String
    ) {
        self.withdrawID = withdrawID
        self.userID = userID
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }

    enum CodingKeys: String, CodingKey {
        case withdrawID = "withdrawId"
        case userID = "userId"
        case name
        case email
        case phoneNumber
    }
}

extension FetchWithdrawUserListResponseDTO {
    func toDomain() -> [WithdrawUserInfoEntity] {
        students.map { $0.toDomain() }
    }
}

extension WithdrawUserInfoResponseDTO {
    func toDomain() -> WithdrawUserInfoEntity {
        WithdrawUserInfoEntity(
            withdrawID: withdrawID,
            userID: userID,
            name: name,
            email: email,
            phoneNumber: phoneNumber
        )
    }
}
