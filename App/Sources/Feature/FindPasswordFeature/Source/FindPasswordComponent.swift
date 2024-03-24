import NeedleFoundation
import SwiftUI
import Service

public protocol FindPasswordDependency: Dependency {}

public final class FindPasswordComponent: Component<FindPasswordDependency>, FindPasswordFactory {
    public func makeView() -> some View {
        FindPasswordView(viewModel: .init())
    }
}
