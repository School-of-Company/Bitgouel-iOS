import Foundation

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedAlterBottomSheet: Bool = false
    @Published var isPresentedActivityListView: Bool = false
    @Published var isPresentedInputCertificationView: Bool = false
    @Published var certificationName: String = ""
    @Published var acquisitionDate = Date()
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

    func updateCertificationInfo(name: String, date: Date) {
        certificationName = name
        acquisitionDate = date
    }
}
