import NeedleFoundation
import SwiftUI
import Service

public protocol InputOrganizationDependency: Dependency {
    var createdCompanyUseCase: any CreatedCompanyUseCase { get }
}

public final class InputOrganizationComponent: Component<InputOrganizationDependency>, InputOrganizationFactory {
    public func makeView() -> some View {
        InputOrganizationView(
            viewModel: .init(
                createdCompanyUseCase: dependency.createdCompanyUseCase
            )
        )
    }
}
