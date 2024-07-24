import NeedleFoundation
import SwiftUI
import Service

public protocol InputOrganizationDependency: Dependency {
    var createdCompanyUseCase: any CreatedCompanyUseCase { get }
    var createdGovernmentUseCase: any CreatedGovernmentUseCase { get }
}

public final class InputOrganizationComponent: Component<InputOrganizationDependency>, InputOrganizationFactory {
    public func makeView(type: OrganizationType) -> some View {
        InputOrganizationView(
            viewModel: .init(
                organization: type,
                createdCompanyUseCase: dependency.createdCompanyUseCase,
                createdGovernmentUseCase: dependency.createdGovernmentUseCase
            )
        )
    }
}
