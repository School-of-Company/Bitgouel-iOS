import NeedleFoundation
import Service
import SwiftUI

public protocol InputCertificationDependency: Dependency {
    var inputCertificationUseCase: any InputCertificationUseCase { get }
}

public final class InputCertificationComponent: Component<InputCertificationDependency>, InputCertificationFactory {
    public func makeView() -> some View {
        InputCertificationView(
            viewModel: .init(
                inputCertificationUseCase: dependency.inputCertificationUseCase
            )
        )
    }
}
