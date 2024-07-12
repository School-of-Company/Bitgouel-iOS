import NeedleFoundation
import SwiftUI

public protocol SchoolListDependency: Dependency {}

public final class SchoolListComponent: Component<SchoolListDependency>, SchoolListFactory {
    public func makeView() -> some View {
        SchoolListView(viewModel: .init())
    }
}
