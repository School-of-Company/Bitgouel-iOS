import Foundation

public struct ActivitiesResponseDTO: Decodable {
    public let content: [ActivityInfo]
    public let pageable: Pageable
    public let totalPages: Int
    public let totalElements: Int
    public let last: Bool
    public let numberOfElements: Int
    public let number: Int
    public let sort: Sort
    public let first: Bool
    public let size: Int
    public let empty: Bool

    public init(
        content: [ActivityInfo],
        pageable: Pageable,
        totalPages: Int,
        totalElements: Int,
        last: Bool,
        numberOfElements: Int,
        number: Int,
        sort: Sort,
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

    public struct ActivityInfo: Decodable {
        public let activityId: UUID
        public let title: String
        public let activityDate: String
        public let userId: UUID
        public let username: String
        public let approveStatus: ApproveStatusType
    }

    public struct Pageable: Decodable {
        public let sort: Sort
        public let pageSize: Int
        public let pageNumber: Int
        public let offset: Int
        public let paged: Bool
        public let unpaged: Bool
    }

    public struct Sort: Decodable {
        public let unsorted: Bool
        public let sorted: Bool
        public let empty: Bool
    }
}

extension ActivitiesResponseDTO.ActivityInfo {
    func toDomain() -> SingleActivityEntity {
        SingleActivityEntity(
            activityId: activityId,
            title: title,
            date: activityDate,
            userId: userId,
            name: username,
            state: approveStatus
        )
    }
}

extension ActivitiesResponseDTO.Pageable {
    func toDomain() -> PagedActivityListEntity {
        PagedActivityListEntity(
            sort: sort.toDomain(),
            pageSize: pageSize,
            pageNumber: pageNumber,
            offset: offset,
            paged: paged,
            unpaged: unpaged
        )
    }
}

extension ActivitiesResponseDTO.Sort {
    func toDomain() -> SortEntity {
        SortEntity(
            unsorted: unsorted,
            sorted: sorted,
            empty: empty
        )
    }
}

extension ActivitiesResponseDTO {
    func toDomain() -> ActivityEntity {
        ActivityEntity(
            content: content.map { $0.toDomain() },
            pageable: pageable.toDomain(),
            totalPages: totalPages,
            totalElements: totalElements,
            last: last,
            numberOfElements: numberOfElements,
            number: number,
            sort: sort.toDomain(),
            first: first,
            size: size,
            empty: empty
        )
    }
}
