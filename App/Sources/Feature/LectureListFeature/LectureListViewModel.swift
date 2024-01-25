import Service
import SwiftUI

final class LectureListViewModel: ObservableObject {
    @Published var selectedLectureType: String = ""
    @Published var selectedapproveStatusType: String = ""
    @Published var filteredLectureList: [LectureType] = []
    @Published var isNavigateLectureDetailDidTap = false
    @AppStorage("admin") var isAdmin = false
    let lectureType: [LectureType] = LectureType.allCases
    let approveStatusType: [ApproveStatusType] = ApproveStatusType.allCases

    func filteredLectureType(_ filterType: LectureType) {
        filteredLectureList = lectureType.filter { lecture in
            return lecture.display() == selectedLectureType
        }
    }
}
