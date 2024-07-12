import Foundation

final class SchoolListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var selectedPage: AdminPageFlow = .school

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
        selectedPage = page
    }
}
