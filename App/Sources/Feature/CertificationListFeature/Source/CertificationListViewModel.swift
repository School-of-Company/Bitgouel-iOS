import Foundation
import Service

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedActivityListView: Bool = false
    @Published var studentInfo: StudentDetailByClubEntity?
    @Published var certificationList: [CertificationInfoEntity] = []
    @Published var authority: UserAuthorityType = .user
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

    func isPresentedActivityListView(state: Bool) {
        isPresentedActivityListView = state
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
