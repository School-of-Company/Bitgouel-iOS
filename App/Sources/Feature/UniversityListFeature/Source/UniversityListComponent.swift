import NeedleFoundation
import SwiftUI

public protocol UniversityListDependency: Dependency {}

public final class UniversityListComponent: Component<UniversityListDependency>, UniversityListFactory {
    public func makeView() -> some View {
        UniversityListView(viewModel: .init())
    }
}
