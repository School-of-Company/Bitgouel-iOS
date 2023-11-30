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
    
    init(
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
}

public extension ActivitiesResponseDTO {
    struct ActivityInfo: Decodable {
        public let activityId: UUID
        public let title: String
        public let activityDate: String
        public let userId: UUID
        public let username: String
        public let approveStatus: ApproveStatusType
    }
    
    struct Pageable: Decodable {
        public let sort: Sort
        public let pageSize: Int
        public let pageNumber: Int
        public let offset: Int
        public let paged: Bool
        public let unpaged: Bool
    }
    
    struct Sort: Decodable {
        public let unsorted: Bool
        public let sorted: Bool
        public let empty: Bool
    }
}

