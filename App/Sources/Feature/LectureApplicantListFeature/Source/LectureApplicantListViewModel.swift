import Foundation
import Service

enum LectureApplicantListPageState {
    case general
    case check
}

final class LectureApplicantListViewModel: BaseViewModel {
    @Published var applicantList: [ApplicantInfoEntity] = []
    @Published var selectedStudentID: String = ""
    @Published var isComplete: Bool = false
    @Published var state: LectureApplicantListPageState = .general
    var lectureID: String = ""
    var students: [String] = []

    private let fetchApplicantListUseCase: any FetchApplicantListUseCase
    private let setLectureCompletionUseCase: any SetLectureCompletionUseCase

    init(
        lectureID: String,
        fetchApplicantListUseCase: any FetchApplicantListUseCase,
        setLectureCompletionUseCase: any SetLectureCompletionUseCase
    ) {
        self.lectureID = lectureID
        self.fetchApplicantListUseCase = fetchApplicantListUseCase
        self.setLectureCompletionUseCase = setLectureCompletionUseCase
    }

    func updateApplicantInfo(isSelected: Bool, studentID: String) {
        isComplete = isSelected
        selectedStudentID = studentID
    }

    func updateState(state: LectureApplicantListPageState) {
        self.state = state
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
                try await setLectureCompletionUseCase(
                    lectureID: lectureID,
                    students: students
                )
            } catch {
                errorMessage = error.lectureDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
