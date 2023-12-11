import Foundation

public struct ActivityEntity: Equatable {
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
    
    init(
        content: [SingleActivityEntity],
        pageable: PagedActivityListEntity,
        totalPages: Int,
        totalElements: Int,
        last: Bool,
        numberOfElements: Int,
        number: Int,
        sort: SortEntity,
        first: Bool,
        size: Int,
        empty: Bool
    ) {
        self.content = content
        self.pageable = pageable
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.last = last
        self.numberOfElements = numberOfElements
        self.number = number
        self.sort = sort
        self.first = first
        self.size = size
        self.empty = empty
    }
}
