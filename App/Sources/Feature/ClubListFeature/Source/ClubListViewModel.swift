import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isShowingLoginAlert: Bool = false
    @Published var schoolList: [SchoolInfoModel] = []
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

    func updateSchoolList(model: [SchoolInfoModel]) {
        schoolList = model
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
                let response = try await fetchSchoolListUseCase()

                updateSchoolList(model: response.map {
                    SchoolInfoModel(
                        schoolName: $0.schoolName,
                        clubs: $0.clubs.map {
                            ClubInfoModel(
                                clubID: $0.clubID,
                                clubName: $0.clubName
                            )
                        }
                    )
                })
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

                updateSchoolList(model: response.map {
                    SchoolInfoModel(
                        schoolName: $0.schoolName,
                        clubs: [ClubInfoModel(
                            clubID: $0.clubID,
                            clubName: $0.name
                        )]
                    )
                })
            } catch {
                errorMessage = error.clubDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
