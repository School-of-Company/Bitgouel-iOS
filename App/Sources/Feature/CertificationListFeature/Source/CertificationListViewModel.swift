import Foundation

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedActivityListView: Bool = false
    var studentID: String = ""

    init(
        studentID: String
    ) {
        self.studentID = studentID
    }

    func isPresentedActivityListView(state: Bool) {
        isPresentedActivityListView = state
    }
}
