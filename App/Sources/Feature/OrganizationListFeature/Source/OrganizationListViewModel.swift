import Foundation
import Service

final class OrganizationListViewModel: BaseViewModel {
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var isShowingOrganizationDetailBottomSheet: Bool = false
    @Published var isPresentedInputOrganizationPage: Bool = false
    @Published var selectedPage: AdminPageFlow
    @Published var organizationList: [OrganizationListModel] = []
    @Published var selectedOrganizationName: String = ""
    @Published var selectedOrganizationField: String = ""
    @Published var organizationID: Int = 0
    let organization: OrganizationType

    private let fetchCompanyListUseCase: any FetchCompanyListUseCase
    private let deleteCompanyUseCase: any DeleteCompanyUseCase
    private let fetchGovernmentListUseCase: any FetchGovernmentListUseCase
    private let deleteGovernmentUseCase: any DeleteGovernmentUseCase

    init(
        organization: OrganizationType,
        selectedPage: AdminPageFlow,
        fetchCompanyListUseCase: any FetchCompanyListUseCase,
        deleteCompanyUseCase: any DeleteCompanyUseCase,
        fetchGovernmentListUseCase: any FetchGovernmentListUseCase,
        deleteGovernmentUseCase: any DeleteGovernmentUseCase
    ) {
        self.organization = organization
        self.selectedPage = selectedPage
        self.fetchCompanyListUseCase = fetchCompanyListUseCase
        self.deleteCompanyUseCase = deleteCompanyUseCase
        self.fetchGovernmentListUseCase = fetchGovernmentListUseCase
        self.deleteGovernmentUseCase = deleteGovernmentUseCase
    }

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateIsShowingOrganizationDetailBottomSheet(isShowing: Bool) {
        isShowingOrganizationDetailBottomSheet = isShowing
    }

    func updateIsPresentedInputOrganizationPage(isPresented: Bool) {
        isPresentedInputOrganizationPage = isPresented
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
        selectedPage = page
    }

    func updateSelectedOrganizationInfo(name: String, field: String, id: Int) {
        selectedOrganizationName = name
        selectedOrganizationField = field
        organizationID = id
    }

    func updateOrganizationList(list: [OrganizationListModel]) {
        organizationList = list
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                switch organization {
                case .company:
                    return try await fetchCompanyList()

                case .government:
                    return try await fetchGovernmentList()
                }
            } catch {
                print(error.companyDomainErrorMessage())
            }
        }
    }

    @MainActor
    func deleteOrganization(_ success: @escaping () -> Void) {
        Task {
            do {
                switch organization {
                case .company:
                    try await deleteCompanyUseCase(companyID: organizationID)

                case .government:
                    try await deleteGovernmentUseCase(governmentID: organizationID)
                }

                success()
            } catch {
                errorMessage = error.companyDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func fetchCompanyList() async throws {
        let companyList = try await fetchCompanyListUseCase()

        updateOrganizationList(
            list: companyList.map {
                .init(
                    organizationID: $0.companyID,
                    name: $0.companyName,
                    field: $0.field
                )
            }
        )
    }

    @MainActor
    func fetchGovernmentList() async throws {
        let governmentList = try await fetchGovernmentListUseCase()

        updateOrganizationList(
            list: governmentList.map {
                .init(
                    organizationID: $0.governmentID,
                    name: $0.governmentName,
                    field: $0.field
                )
            }
        )
    }
}
