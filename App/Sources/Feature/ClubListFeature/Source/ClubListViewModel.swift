import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isPresentedSelectedSchoolPopup: Bool = true
    var schoolList: [HighSchoolType] = HighSchoolType.allCases
    @Published var clubList: [ClubEntity] = []
    
    private let queryClubListUseCase: any QueryClubListUseCase
    
    init(
        queryClubListUseCase: any QueryClubListUseCase
    ) {
        self.queryClubListUseCase = queryClubListUseCase
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
