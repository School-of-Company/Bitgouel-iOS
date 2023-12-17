import Foundation

public struct PagedActivityListEntity: Equatable {
    public let sort: SortEntity
    public let pageSize: Int
    public let pageNumber: Int
    public let offset: Int
    public let paged: Bool
    public let unpaged: Bool

    init(
        sort: SortEntity,
        pageSize: Int,
        pageNumber: Int,
        offset: Int,
        paged: Bool,
        unpaged: Bool
    ) {
        self.sort = sort
        self.pageSize = pageSize
        self.pageNumber = pageNumber
        self.offset = offset
        self.paged = paged
        self.unpaged = unpaged
    }
}
