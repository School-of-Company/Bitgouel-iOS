import Foundation
import Service

final class SchoolListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var isShowingSchoolDetailBottomSheet: Bool = false
    @Published var isPresentedInputSchoolInfoView: Bool = false
    @Published var selectedPage: AdminPageFlow = .school
    @Published var schoolList: [SchoolListEntity] = []
    @Published var selectedSchoolInfo: SchoolListEntity?
    @Published var state: String = ""

    private let fetchSchoolListUseCase: any FetchSchoolListUseCase
    private let fetchSchoolDetailUseCase: any FetchSchoolDetailUseCase

    init(
        fetchSchoolListUseCase: any FetchSchoolListUseCase,
        fetchSchoolDetailUseCase: any FetchSchoolDetailUseCase
    ) {
        self.fetchSchoolListUseCase = fetchSchoolListUseCase
        self.fetchSchoolDetailUseCase = fetchSchoolDetailUseCase
    }

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateIsShowingSchoolDetailBottomSheet(isShowing: Bool) {
        isShowingSchoolDetailBottomSheet = isShowing
    }

    func updateIsPresentedInputSchoolInfoView(isPresented: Bool, state: String) {
        isPresentedInputSchoolInfoView = isPresented
        self.state = state
    }

    func updateSelectedSchoolInfo(schoolInfo: SchoolListEntity) {
        selectedSchoolInfo = schoolInfo
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
        selectedPage = page
    }

    @MainActor
    func onApper() {
        Task {
            do {
                schoolList = try await fetchSchoolListUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func fetchSchoolDetail(schoolID: Int) {
        Task {
            do {
                selectedSchoolInfo = try await fetchSchoolDetailUseCase(schoolID: schoolID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
