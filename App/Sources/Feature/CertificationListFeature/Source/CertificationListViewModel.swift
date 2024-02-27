import Foundation
import Service

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedAlterBottomSheet: Bool = false
    @Published var isPresentedActivityListView: Bool = false
    var studentID: String = ""
    var clubID: String = ""
    
    private let queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase

    init(
        clubID: String,
        studentID: String,
        queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase
    ) {
        self.studentID = studentID
        self.queryStudentDetailByClubUseCase = queryStudentDetailByClubUseCase
    }

    func isPresentedAlterBottomSheet(state: Bool) {
        isPresentedAlterBottomSheet = state
    }

    func isPresentedActivityListView(state: Bool) {
        isPresentedActivityListView = state
    }

    func onAppear() {
        Task {
            try await queryStudentDetailByClubUseCase(clubID: clubID, studentID: studentID)
        }
    }
}
