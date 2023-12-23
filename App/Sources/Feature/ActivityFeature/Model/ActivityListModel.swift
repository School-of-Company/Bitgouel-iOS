import Foundation
import Service

@MainActor
final class ActivityListModel: ObservableObject {
    @Published var authority: UserAuthorityType = .user
    @Published var content: [ActivityEntity] = []
}

extension ActivityListModel {
    func updateUserRole(authority: UserAuthorityType) {
        self.authority = authority
    }

    func updateContent(entity: [ActivityEntity]) {
        self.content = entity
    }
}
