import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isShowingLoginAlert: Bool = false
    @Published var schoolClubList: [SchoolListEntity] = []
    @Published var clubList: [ClubEntity] = []
    @Published var clubID: Int = 0
    @Published var isPresentedSelectedSchoolPopup: Bool = false
    @Published var isPresentedClubDetailView: Bool = false
    var schoolList: [HighSchoolType] = HighSchoolType.allCases
    var authority: UserAuthorityType = .user

    private let fetchClubListUseCase: any FetchClubListUseCase
    private let fetchSchoolListUseCase: any FetchSchoolListUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    init(
        fetchClubListUseCase: any FetchClubListUseCase,
        fetchSchoolListUseCase: any FetchSchoolListUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.fetchClubListUseCase = fetchClubListUseCase
        self.fetchSchoolListUseCase = fetchSchoolListUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
    }

    func updateClubID(clubID: Int) {
        self.clubID = clubID
    }

    func updateIsShowingLoginAlert(isShowing: Bool) {
        isShowingLoginAlert = isShowing
    }

    func updateIsPresentedClubDetailView(isPresented: Bool) {
        isPresentedClubDetailView = isPresented
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        switch authority {
        case .admin:
            fetchSchoolList()

        case .user:
            updateIsShowingLoginAlert(isShowing: true)

        default:
            isPresentedClubDetailView = true
        }
    }

    @MainActor
    func fetchSchoolList() {
        Task {
            do {
                schoolClubList = try await fetchSchoolListUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func fetchClubList() {
        Task {
            do {
                guard let selectedSchool else { return }

                clubList = try await fetchClubListUseCase(highSchool: selectedSchool.rawValue)
            } catch {
                errorMessage = error.clubDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
