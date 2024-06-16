import Foundation
import Service

final class StudentInfoViewModel: BaseViewModel {
    @Published var isPresentedActivityListView: Bool = false
    @Published var isPresentedInputCertificationView: Bool = false
    @Published var studentInfo: StudentDetailByClubEntity?
    @Published var certificationList: [CertificationInfoEntity] = []
    @Published var appliedLectureList: [AppliedLectureEntity] = []
    @Published var authority: UserAuthorityType = .user

    @Published var selectedEpic: String = ""
    @Published var selectedCertificationID: String = ""
    @Published var selectedCertificationName: String = ""
    @Published var selectedAcquisitionDate = Date()
    var studentID: String = ""
    var clubID: Int = 0

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchStudentDetailByClubUseCase: any FetchStudentDetailByClubUseCase
    private let fetchCertificationListByStudent: any FetchCertificationListByStudentUseCase
    private let fetchCertificationListByTeacher: any FetchCertificationListByTeacherUseCase
    private let fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase

    init(
        clubID: Int,
        studentID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchStudentDetailByClubUseCase: any FetchStudentDetailByClubUseCase,
        fetchCertificationListByStudent: any FetchCertificationListByStudentUseCase,
        fetchCertificationListByTeacher: any FetchCertificationListByTeacherUseCase,
        fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase
    ) {
        self.clubID = clubID
        self.studentID = studentID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchStudentDetailByClubUseCase = fetchStudentDetailByClubUseCase
        self.fetchCertificationListByStudent = fetchCertificationListByStudent
        self.fetchCertificationListByTeacher = fetchCertificationListByTeacher
        self.fetchAppliedLectureListUseCase = fetchAppliedLectureListUseCase
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

    func selectedCertification(certificationID: String, certificationName: String, acquisitionDate: String) {
        selectedCertificationID = certificationID
        selectedCertificationName = certificationName
        selectedAcquisitionDate = acquisitionDate.toDateCustomFormat(format: "yyyy-M-d")
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                try await updateStudentInfo()

                switch authority {
                case .student:
                    try await updateCertificationListByStudent()
                    try await updateAppliedLectureList()

                case .admin,
                     .teacher:
                    try await updateCertificationListByTeacher()
                    try await updateAppliedLectureList()

                default:
                    try await updateCertificationListByTeacher()
                }

                isLoading = false
            } catch {
                errorMessage = error.certificationDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func updateStudentInfo() async throws {
        studentInfo = try await fetchStudentDetailByClubUseCase(clubID: clubID, studentID: studentID)
    }

    @MainActor
    func updateCertificationListByStudent() async throws {
        certificationList = try await fetchCertificationListByStudent()
    }

    @MainActor
    func updateCertificationListByTeacher() async throws {
        certificationList = try await fetchCertificationListByTeacher(studentID: studentID)
    }

    @MainActor
    func updateAppliedLectureList() async throws {
        appliedLectureList = try await fetchAppliedLectureListUseCase(studentID: studentID)
    }
}
