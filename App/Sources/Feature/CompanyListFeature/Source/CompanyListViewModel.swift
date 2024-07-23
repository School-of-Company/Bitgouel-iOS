import Foundation
import Service

final class CompanyListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var isShowingCompanyDetailBottomSheet: Bool = false
    @Published var isPresentedInputCompanyPage: Bool = false
    @Published var selectedPage: AdminPageFlow = .company
    @Published var companyList: [CompanyInfoEntity] = [.init(companyID: "1", companyName: "현주", field: .aiConvergence)]
    @Published var selectedCompanyName: String = ""
    @Published var selectedCompanyDetailInfo: String = ""

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateIsShowingCompanyDetailBottomSheet(isShowing: Bool) {
        isShowingCompanyDetailBottomSheet = isShowing
    }

    func updateIsPresentedInputCompanyPage(isPresented: Bool) {
        isPresentedInputCompanyPage = isPresented
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
        selectedPage = page
    }

    func updateSelectedCompanyInfo(name: String, detailInfo: String) {
        selectedCompanyName = name
        selectedCompanyDetailInfo = detailInfo
    }
}
