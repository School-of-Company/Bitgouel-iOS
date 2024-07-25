import Foundation
import Service

final class UniversityListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var isShowingUniversityDetailBottomSheet: Bool = false
    @Published var isPresentedInputUniversityPage: Bool = false
    @Published var selectedPage: AdminPageFlow = .company
    @Published var universityList: [UniversityInfoEntity] = []
    var state: String = ""
    var selectedUniversityName: String = ""
    var selectedDepartmentList: [String] = []

    private let fetchUniversityListUseCase: any FetchUniversityListUseCase

    init(fetchUniversityListUseCase: any FetchUniversityListUseCase) {
        self.fetchUniversityListUseCase = fetchUniversityListUseCase
    }

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateIsShowingUniversityDetailBottomSheet(isShowing: Bool) {
        isShowingUniversityDetailBottomSheet = isShowing
    }

    func updateIsPresentedInputUniversityPage(isPresented: Bool) {
        isPresentedInputUniversityPage = isPresented
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
        selectedPage = page
    }

    func updateSelectedUniversityInfo(name: String, departments: [String]) {
        selectedUniversityName = name
        selectedDepartmentList = departments
    }

    func updateState(state: String) {
        self.state = state
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                universityList = try await fetchUniversityListUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
