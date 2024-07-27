import NeedleFoundation
import Service
import SwiftUI

public protocol OrganizationListDependency: Dependency {
    var fetchCompanyListUseCase: any FetchCompanyListUseCase { get }
    var deleteCompanyUseCase: any DeleteCompanyUseCase { get }
    var inputOrganizationFactory: any InputOrganizationFactory { get }
    var fetchGovernmentListUseCase: any FetchGovernmentListUseCase { get }
    var deleteGovernmentUseCase: any DeleteGovernmentUseCase { get }
}

public final class OrganizationListComponent: Component<OrganizationListDependency>, OrganizationListFactory {
    public func makeView(type: OrganizationType, selectedPage: AdminPageFlow) -> some View {
        OrganizationListView(
            viewModel: .init(
                organization: type,
                selectedPage: selectedPage,
                fetchCompanyListUseCase: dependency.fetchCompanyListUseCase,
                deleteCompanyUseCase: dependency.deleteCompanyUseCase,
                fetchGovernmentListUseCase: dependency.fetchGovernmentListUseCase,
                deleteGovernmentUseCase: dependency.deleteGovernmentUseCase
            ),
            inputOrganizationFactory: dependency.inputOrganizationFactory
        )
    }
}
