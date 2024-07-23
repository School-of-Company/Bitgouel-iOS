import Foundation
import Service

final class CompanyListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var isShowingCompanyDetailBottomSheet: Bool = false
    @Published var isPresentedInputCompanyPage: Bool = false
    @Published var selectedPage: AdminPageFlow = .company
    @Published var companyList: [CompanyInfoEntity] = []
    @Published var selectedCompanyName: String = ""
    @Published var selectedCompanyDetailInfo: String = ""
    @Published var companyID: Int = 0

    private let fetchCompanyListUseCase: any FetchCompanyListUseCase
    private let deleteCompanyUseCase: any DeleteCompanyUseCase

    init(
        fetchCompanyListUseCase: any FetchCompanyListUseCase,
        deleteCompanyUseCase: any DeleteCompanyUseCase
    ) {
        self.fetchCompanyListUseCase = fetchCompanyListUseCase
        self.deleteCompanyUseCase = deleteCompanyUseCase
    }

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

    func updateSelectedCompanyInfo(name: String, detailInfo: String, id: Int) {
        selectedCompanyName = name
        selectedCompanyDetailInfo = detailInfo
        companyID = id
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                companyList = try await fetchCompanyListUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func deleteCompany(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deleteCompanyUseCase(companyID: companyID)

                success()
            } catch {
                errorMessage = error.companyDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
