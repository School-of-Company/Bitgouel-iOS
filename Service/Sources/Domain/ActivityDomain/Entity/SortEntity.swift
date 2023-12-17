import Foundation

public struct SortEntity: Equatable {
    public let unsorted: Bool
    public let sorted: Bool
    public let empty: Bool

    public init(unsorted: Bool, sorted: Bool, empty: Bool) {
        self.unsorted = unsorted
        self.sorted = sorted
        self.empty = empty
    }
}
