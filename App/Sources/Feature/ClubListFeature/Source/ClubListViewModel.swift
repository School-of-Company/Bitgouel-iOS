import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isPresentedSelectedSchoolPopup: Bool = false
    @Published var isPresentedClubDetailView: Bool = false
    @Published var isShowingLoginAlert: Bool = false
    @Published var clubList: [ClubEntity] = []
    @Published var clubID: Int = 0
    var schoolList: [HighSchoolType] = HighSchoolType.allCases
    var authority: UserAuthorityType = .user

    private let queryClubListUseCase: any QueryClubListUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    init(
        queryClubListUseCase: any QueryClubListUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.queryClubListUseCase = queryClubListUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
    }

    func updateClubID(clubID: Int) {
        self.clubID = clubID
    }

    func updateIsShowingLoginAlert(isShowing: Bool) {
        isShowingLoginAlert = isShowing
    }

    func onAppear() {
        authority = loadUserAuthorityUseCase()

        switch authority {
        case .admin:
            isPresentedSelectedSchoolPopup = true

        case .user:
            updateIsShowingLoginAlert(isShowing: true)

        default:
            isPresentedClubDetailView = true
        }
    }

    @MainActor
    func fetchClubList() {
        Task {
            do {
                guard let selectedSchool else { return }

                clubList = try await queryClubListUseCase(highSchool: selectedSchool.rawValue)
            } catch {
                print(String(describing: error))
            }
        }
    }
}
