import Foundation
import Service

final class LectureApplicantListViewModel: BaseViewModel {
    @Published var applicantList: [ApplicantInfoEntity] = []
    @Published var selectedStudentID: String = ""
    @Published var isComplete: Bool = false
    var lectureID: String = ""

    private let fetchApplicantListUseCase: any FetchApplicantListUseCase
    private let modifyApplicantWhetherUseCase: any ModifyApplicantWhetherUseCase
    
    init(
        lectureID: String,
        fetchApplicantListUseCase: any FetchApplicantListUseCase,
        modifyApplicantWhetherUseCase: any ModifyApplicantWhetherUseCase
    ) {
        self.lectureID = lectureID
        self.fetchApplicantListUseCase = fetchApplicantListUseCase
        self.modifyApplicantWhetherUseCase = modifyApplicantWhetherUseCase
    }

    func updateApplicantInfo(isSelected: Bool, studentID: String) {
        isComplete = isSelected
        selectedStudentID = studentID
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                applicantList = try await fetchApplicantListUseCase(lectureID: lectureID)
            } catch {
                errorMessage = error.lectureDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func modifyApplicantWhether() {
        Task {
            do {
                try await modifyApplicantWhetherUseCase(lectureID: lectureID, studentID: selectedStudentID, isComplete: isComplete)
            } catch {
                errorMessage = error.lectureDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
