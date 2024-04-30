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
    private let queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase
    private let queryCertificationListByStudent: any QueryCertificationListByStudentUseCase
    private let queryCertificationListByTeacher: any QueryCertificationListByTeacherUseCase
    private let fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase

    init(
        clubID: Int,
        studentID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase,
        queryCertificationListByStudent: any QueryCertificationListByStudentUseCase,
        queryCertificationListByTeacher: any QueryCertificationListByTeacherUseCase,
        fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase
    ) {
        self.clubID = clubID
        self.studentID = studentID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryStudentDetailByClubUseCase = queryStudentDetailByClubUseCase
        self.queryCertificationListByStudent = queryCertificationListByStudent
        self.queryCertificationListByTeacher = queryCertificationListByTeacher
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

        Task {
            do {
                try await updateStudentInfo()

                switch authority {
                case .student:
                    try await updateCertificationListByStudent()

                case .admin,
                     .teacher:
                    try await updateCertificationListByTeacher()
                    try await updateAppliedLectureList()

                default:
                    try await updateCertificationListByTeacher()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func updateStudentInfo() async throws {
        studentInfo = try await queryStudentDetailByClubUseCase(clubID: clubID, studentID: studentID)
    }

    @MainActor
    func updateCertificationListByStudent() async throws {
        certificationList = try await queryCertificationListByStudent()
    }

    @MainActor
    func updateCertificationListByTeacher() async throws {
        certificationList = try await queryCertificationListByTeacher(studentID: studentID)
    }

    @MainActor
    func updateAppliedLectureList() async throws {
        appliedLectureList = try await fetchAppliedLectureListUseCase(studentID: studentID)
    }
}