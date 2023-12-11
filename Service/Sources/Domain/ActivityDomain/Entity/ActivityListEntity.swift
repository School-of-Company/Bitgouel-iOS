import Foundation

public struct ActivityListEntity: Equatable {
    public let content: [SingleActivityEntity]
    public let pageable: PagedActivityListEntity
    public let totalPages: Int
    public let totalElements: Int
    public let last: Bool
    public let numberOfElements: Int
    public let number: Int
    public let sort: SortEntity
    public let first: Bool
    public let size: Int
    public let empty: Bool
}
