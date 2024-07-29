import Foundation
import Service

public struct SchoolDetailInfoModel: Equatable {
    public let schoolID: Int
    public let logoImageURL: String
    public let name: String
    public let line: LineType
    public let departmentList: [String]
    public let clubList: [ClubDetailModel]

    public init(
        schoolID: Int,
        logoImageURL: String,
        name: String,
        line: LineType,
        departmentList: [String],
        clubList: [ClubDetailModel]
    ) {
        self.schoolID = schoolID
        self.logoImageURL = logoImageURL
        self.name = name
        self.line = line
        self.departmentList = departmentList
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
