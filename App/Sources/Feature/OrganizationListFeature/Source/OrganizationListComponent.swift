import NeedleFoundation
import SwiftUI
import Service

public protocol OrganizationListDependency: Dependency {
    var fetchCompanyListUseCase: any FetchCompanyListUseCase { get }
    var deleteCompanyUseCase: any DeleteCompanyUseCase { get }
    var inputCompanyFactory: any InputCompanyFactory { get }
}

public final class OrganizationListComponent: Component<CompanyListDependency>, OrganizationListFactory {
    public func makeView() -> some View {
        OrganizationListView(
            viewModel: .init(
                fetchCompanyListUseCase: dependency.fetchCompanyListUseCase,
                deleteCompanyUseCase: dependency.deleteCompanyUseCase
            ),
            inputCompanyFactory: dependency.inputCompanyFactory
        )
    }
}
