import Foundation
import Service

public struct SchoolDetailInfoModel: Equatable {
    public let logoImageURL: String
    public let name: String
    public let line: String
    public let clubList: [ClubDetailModel]

    public init(
        logoImageURL: String,
        name: String,
        line: String,
        clubList: [ClubDetailModel]
    ) {
        self.logoImageURL = logoImageURL
        self.name = name
        self.line = line
        self.clubList = clubList
    }
}

public struct ClubDetailModel: Equatable {
    public let clubID: Int
    public let name: String
    public let field: FieldType

    public init(
        clubID: Int,
        name: String,
        field: FieldType
    ) {
        self.clubID = clubID
        self.name = name
        self.field = field
    }
}
