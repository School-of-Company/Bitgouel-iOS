import Foundation
import Service

final class SchoolListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var isShowingSchoolDetailBottomSheet: Bool = false
    @Published var isPresentedInputSchoolInfoView: Bool = false
    @Published var selectedPage: AdminPageFlow = .school
    @Published var schoolInfo: SchoolDetailInfoModel = .init(
        logoImageURL: "",
        name: "",
        line: "",
        clubList: [.init(clubID: 0, name: "", field: .culture)]
    )
    @Published var schoolList: [SchoolListEntity] = []
    @Published var state: String = ""

    private let fetchSchoolListUseCase: any FetchSchoolListUseCase

    init(fetchSchoolListUseCase: any FetchSchoolListUseCase) {
        self.fetchSchoolListUseCase = fetchSchoolListUseCase
    }
    
    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateIsShowingSchoolDetailBottomSheet(isShowing: Bool) {
        isShowingSchoolDetailBottomSheet = isShowing
    }

    func updateIsPresentedInputSchoolInfoView(isPresented: Bool, state: String) {
        isPresentedInputSchoolInfoView = isPresented
    }

    func updateSchoolDetailInfo(info: SchoolDetailInfoModel) {
        schoolInfo = info
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
                print(String(describing: error))
            }
        }
    }
}
