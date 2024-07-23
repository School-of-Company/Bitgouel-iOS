import NeedleFoundation
import SwiftUI
import Service

public protocol CompanyListDependency: Dependency {
    var fetchCompanyListUseCase: any FetchCompanyListUseCase { get }
    var deleteCompanyUseCase: any DeleteCompanyUseCase { get }
    var inputCompanyFactory: any InputCompanyFactory { get }
}

public final class CompanyListComponent: Component<CompanyListDependency>, CompanyListFactory {
    public func makeView() -> some View {
        CompanyListView(
            viewModel: .init(
                fetchCompanyListUseCase: dependency.fetchCompanyListUseCase,
                deleteCompanyUseCase: dependency.deleteCompanyUseCase
            ),
            inputCompanyFactory: dependency.inputCompanyFactory
        )
    }
}
