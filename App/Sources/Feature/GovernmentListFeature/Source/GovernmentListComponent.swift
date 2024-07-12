import NeedleFoundation
import SwiftUI

public protocol GovernmentListDependency: Dependency {}

public final class GovernmentListComponent: Component<GovernmentListDependency>, GovernmentListFactory {
    public func makeView() -> some View {
        GovernmentListView(viewModel: .init())
    }
}
