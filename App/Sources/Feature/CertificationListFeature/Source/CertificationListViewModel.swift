import Foundation
import Service

@MainActor
final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedActivityListView: Bool = false
    @Published var studentInfo: StudentDetailByClubEntity?
    @Published var certificationList: [CertificationInfoEntity] = []
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedInputCertificationView: Bool = false
    @Published var selectedEpic: String = ""
    @Published var certificationID: String = ""
    var studentID: String = ""
    var clubID: Int = 0

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase
    private let queryCertificationListByStudent: any QueryCertificationListByStudentUseCase
    private let queryCertificationListByTeacher: any QueryCertificationListByTeacherUseCase

    init(
        clubID: Int,
        studentID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase,
        queryCertificationListByStudent: any QueryCertificationListByStudentUseCase,
        queryCertificationListByTeacher: any QueryCertificationListByTeacherUseCase
    ) {
        self.clubID = clubID
        self.studentID = studentID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryStudentDetailByClubUseCase = queryStudentDetailByClubUseCase
        self.queryCertificationListByStudent = queryCertificationListByStudent
        self.queryCertificationListByTeacher = queryCertificationListByTeacher
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

    func onAppear() {
        authority = loadUserAuthorityUseCase()
        print(authority)

        Task {
            do {
                try await updateStudentInfo()

                switch authority {
                case .student:
                    return try await updateCertificationListByStudent()
                default:
                    return try await updateCertificationListByTeacher()
                }

            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func updateStudentInfo() async throws {
        studentInfo = try await queryStudentDetailByClubUseCase(clubID: clubID, studentID: studentID)
    }

    func updateCertificationListByStudent() async throws {
        certificationList = try await queryCertificationListByStudent()
    }

    func updateCertificationListByTeacher() async throws {
        certificationList = try await queryCertificationListByTeacher(studentID: studentID)
    }
}
