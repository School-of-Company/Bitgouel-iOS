import Foundation

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedAlterBottomSheet: Bool = false
    @Published var isPresentedActivityListView: Bool = false
    var studentID: String = ""

    init(
        studentID: String
    ) {
        self.studentID = studentID
    }

    func isPresentedAlterBottomSheet(state: Bool) {
        isPresentedAlterBottomSheet = state
    }

    func isPresentedActivityListView(state: Bool) {
        isPresentedActivityListView = state
    }
}
