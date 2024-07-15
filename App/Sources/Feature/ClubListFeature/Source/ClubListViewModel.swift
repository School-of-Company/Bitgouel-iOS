import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isShowingLoginAlert: Bool = false
    @Published var schoolList: [SchoolListEntity] = []
    @Published var clubList: [ClubListModel] = []
    @Published var clubID: Int = 0
    @Published var isPresentedSelectedSchoolPopup: Bool = false
    @Published var isPresentedClubDetailView: Bool = false
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

    func updateClubList(clubList: [ClubListModel]) {
        self.clubList = clubList
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
                schoolList = try await fetchSchoolListUseCase()
            } catch {
                print(String(describing: error))
            }
        }
    }

    @MainActor
    func fetchClubList() {
        Task {
            do {
                guard let selectedSchool else { return }

                let response = try await fetchClubListUseCase(highSchool: selectedSchool.rawValue)

                updateClubList(clubList: response.map {
                    .init(
                        clubID: $0.id,
                        clubName: $0.name
                    )
                })
            } catch {
                errorMessage = error.clubDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
