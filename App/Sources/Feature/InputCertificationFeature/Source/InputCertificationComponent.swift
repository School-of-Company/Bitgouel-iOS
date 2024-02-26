import NeedleFoundation
import Service
import SwiftUI

public protocol InputCertificationDependency: Dependency {}

public final class InputCertificationComponent: Component<InputCertificationDependency> , InputCertificationFactory {
    public func makeView() -> some View {
        InputCertificationView(
            viewModel: .init()
        )
    }
}
