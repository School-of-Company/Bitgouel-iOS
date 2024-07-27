import Foundation

final class InputUniversityViewModel: BaseViewModel {
    @Published var universityName: String
    @Published var departmentList: [String]
    @Published var isShowingDeleteAlert: Bool = false
    @Published var isPresentedInputDepartment: Bool = false
    let state: String
    let universityID: Int

    init(
        state: String,
        universityName: String,
        departmentList: [String],
        universityID: Int
    ) {
        self.state = state
        self.universityName = universityName
        self.departmentList = departmentList
        self.universityID = universityID
    }

    func updateIsShowingDeleteAlert(isShowing: Bool) {
        isShowingDeleteAlert = isShowing
    }

    func updateIsPresentedInputDepartment(isPresented: Bool) {
        isPresentedInputDepartment = isPresented
    }

    func editUniversity() {
        #warning("대학 수정 기능 추가")
    }

    func createdUniversity() {
        #warning("대학 등록 기능 추가")
    }

    func deleteUniversity() {
        #warning("대학 삭제 기능 추가")
    }

    func deleteDepartment(department: String) {
        guard department == "" else { return }
        #warning("학과 삭제 기능 추가")
    }
}
