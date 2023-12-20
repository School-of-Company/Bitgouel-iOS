import Foundation

public struct ClubsEntity: Equatable {
    public let clubs: [SingleClubEntity]
    
    public init(clubs: [SingleClubEntity]) {
        self.clubs = clubs
    }
}
