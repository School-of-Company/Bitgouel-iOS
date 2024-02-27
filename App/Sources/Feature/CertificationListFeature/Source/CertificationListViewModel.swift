import Foundation

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedAlterBottomSheet: Bool = false
    @Published var isPresentedActivityListView: Bool = false
    @Published var isPresentedInputCertificationView: Bool = false
    @Published var selectedEpic: String = ""
    @Published var certificationID: String = ""
    var studentID: String = ""

    init(
        studentID: String
    ) {
        self.studentID = studentID
    }

    func updateIsPresentedAlterBottomSheet(isPresented: Bool) {
        isPresentedAlterBottomSheet = isPresented
    }

    func updateIsPresentedActivityListView(isPresented: Bool) {
        isPresentedActivityListView = isPresented
    }

    func updateIsPresentedInputCertificationView(isPresented: Bool) {
        isPresentedInputCertificationView = isPresented
    }
    
    func updateEpic(epic: String) {
        selectedEpic = epic
    }
}
