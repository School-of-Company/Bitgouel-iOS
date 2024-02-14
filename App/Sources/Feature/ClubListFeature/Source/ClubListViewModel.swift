import Foundation
import Service

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isPresentedSelectedSchoolPopup: Bool = true
    var schoolList: [HighSchoolType] = HighSchoolType.allCases
}
