import Foundation
import Service

@MainActor
final class LectureListModel: ObservableObject {
    @Published var authority: UserAuthorityType = .user
    @Published var lectureList: [LectureListEntity] = []
    @Published var selectedUserID: String?
    @Published var isPresentedLectureDetailPage: Bool = false
    var errorMessage: String = ""
}

extension LectureListModel {
    func updateUserRole(authority: UserAuthorityType) {
        self.authority = authority
    }
    
    func updateContent(entity: [LectureListEntity]) {
        self.lectureList = entity
    }
    
    func updateSelectedUserID(userID: String) {
        self.selectedUserID = userID
    }
}
