import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isPresentedSelectedSchoolPopup: Bool = true
    @Published var isPresentedClubDetailView: Bool = false
    @Published var clubList: [ClubEntity] = []
    @Published var clubID: Int = 0
    var schoolList: [HighSchoolType] = HighSchoolType.allCases
    
    private let queryClubListUseCase: any QueryClubListUseCase
    
    init(
        queryClubListUseCase: any QueryClubListUseCase
    ) {
        self.queryClubListUseCase = queryClubListUseCase
    }
    
    func updateClubID(clubID: Int) {
        self.clubID = clubID
    }

    @MainActor
    func fetchClubList() {
        Task {
            do {
                guard let selectedSchool else { return }
                
                clubList = try await queryClubListUseCase(highSchool: selectedSchool.rawValue)
                print(clubList)
            } catch {
                print(String(describing: error))
            }
        }
    }
}
