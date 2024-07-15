import Service
import SwiftUI

final class ClubDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var userID: String = ""
    @Published var isPresentedStudentInfoView: Bool = false
    @Published var studentID: String = ""

    // MARK: ClubInfo

    var clubID: Int = 0
    @Published var clubName: String = ""
    @Published var schoolName: String = ""
    @Published var students: [ClubDetailEntity.MemberInfoEntity] = []
    @Published var teacher: ClubDetailEntity.TeacherInfoEntity?

    // MARK: UseCase

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchClubDetailUseCase: any FetchClubDetailUseCase
    private let fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase
    private let fetchMyInfoUseCase: any FetchMyInfoUseCase

    init(
        clubID: Int,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchClubDetailUseCase: any FetchClubDetailUseCase,
        fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase,
        fetchMyInfoUseCase: any FetchMyInfoUseCase
    ) {
        self.clubID = clubID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchClubDetailUseCase = fetchClubDetailUseCase
        self.fetchStudentListByClubUseCase = fetchStudentListByClubUseCase
        self.fetchMyInfoUseCase = fetchMyInfoUseCase
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                let response = try await fetchMyInfoUseCase()
                let clubDetail = try await fetchClubDetail(authority: authority)

                updateClubDetail(clubInfo: clubDetail)
                userID = response.userID

                isLoading = false
            } catch {
                print(String(describing: error))
            }
        }
    }

    func fetchClubDetail(authority: UserAuthorityType) async throws -> ClubDetailEntity {
        switch authority {
        case .admin:
            return try await fetchClubDetailUseCase(clubID: clubID)

        default:
            return try await fetchStudentListByClubUseCase()
        }
    }

    func updateClubDetail(clubInfo: ClubDetailEntity) {
        clubID = clubInfo.clubID
        clubName = clubInfo.clubName
        schoolName = clubInfo.schoolName
        students = clubInfo.students
        teacher = clubInfo.teacher
    }

    func updateIsPresentedStudentInfoView(isPresented: Bool) {
        isPresentedStudentInfoView = isPresented
    }

    func studentInfoRowDidTap(selectedStudentID: String) {
        studentID = selectedStudentID
        updateIsPresentedStudentInfoView(isPresented: true)
    }
}
