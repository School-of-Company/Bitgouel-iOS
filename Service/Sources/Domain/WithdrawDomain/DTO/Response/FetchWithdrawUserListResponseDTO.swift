import Foundation

public struct FetchWithdrawUserListResponseDTO: Decodable {
    public let students: [WithdrawUserInfo]

    public init(students: [WithdrawUserInfo]) {
        self.students = students
    }

    public struct WithdrawUserInfo: Decodable {
        public let withdrawID: String
        public let userID: String
        public let name: String

        public init(
            withdrawID: String,
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
            case name
        }
    }
}

extension FetchWithdrawUserListResponseDTO {
    func toDomain() -> [WithdrawUserInfoEntity] {
        students.map { $0.toDomain() }
    }
}

extension FetchWithdrawUserListResponseDTO.WithdrawUserInfo {
    func toDomain() -> WithdrawUserInfoEntity {
        WithdrawUserInfoEntity(
            withdrawID: withdrawID,
            userID: userID,
            name: name
        )
    }
}
