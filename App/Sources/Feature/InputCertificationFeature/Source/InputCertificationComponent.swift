import NeedleFoundation
import Service
import SwiftUI

public protocol InputCertificationDependency: Dependency {
    var inputCertificationUseCase: any InputCertificationUseCase { get }
    var updateCertificationUseCase: any UpdateCertificationUseCase { get }
}

public final class InputCertificationComponent: Component<InputCertificationDependency>, InputCertificationFactory {
    public func makeView(
        epic: String,
        certificationID: String
    ) -> some View {
        InputCertificationView(
            viewModel: .init(
                inputCertificationUseCase: dependency.inputCertificationUseCase,
                updateCertificationUseCase: dependency.updateCertificationUseCase,
                epic: epic,
                certificationID: certificationID
            )
        )
    }
}
