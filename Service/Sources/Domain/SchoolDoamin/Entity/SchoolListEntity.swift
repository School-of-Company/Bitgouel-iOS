import Foundation

public struct SchoolListEntity: Equatable {
    public let id: Int
    public let schoolName: String
    public let clubs: [ClubEntity]
}
