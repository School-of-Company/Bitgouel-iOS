import NeedleFoundation
import SwiftUI
import Service

public protocol InputCompanyDependency: Dependency {
    var createdCompanyUseCase: any CreatedCompanyUseCase { get }
}

public final class InputCompanyComponent: Component<InputCompanyDependency>, InputCompanyFactory {
    public func makeView() -> some View {
        InputCompanyView(
            viewModel: .init(
                createdCompanyUseCase: dependency.createdCompanyUseCase
            )
        )
    }
}
