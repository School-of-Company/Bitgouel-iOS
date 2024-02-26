import NeedleFoundation
import Service
import SwiftUI

public protocol InputCertificationDependency: Dependency {
    var inputCertificationUseCase: any InputCertificationUseCase { get }
}

public final class InputCertificationComponent: Component<InputCertificationDependency>, InputCertificationFactory {
    public func makeView(epic: String) -> some View {
        InputCertificationView(
            viewModel: .init(
                inputCertificationUseCase: dependency.inputCertificationUseCase, 
                epic: epic
            )
        )
    }
}
