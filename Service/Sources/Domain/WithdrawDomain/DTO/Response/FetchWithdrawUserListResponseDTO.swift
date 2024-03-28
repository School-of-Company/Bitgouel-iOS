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

    public init(
        withdrawID: Int,
        userID: String,
        name: String
    ) {
        self.withdrawID = withdrawID
        self.userID = userID
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case withdrawID = "withdrawId"
        case userID = "userId"
        case name = "studentName"
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
            name: name
        )
    }
}
