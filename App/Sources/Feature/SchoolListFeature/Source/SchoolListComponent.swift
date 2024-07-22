import NeedleFoundation
import SwiftUI
import Service

public protocol SchoolListDependency: Dependency {
    var fetchSchoolListUseCase: any FetchSchoolListUseCase { get }
}

public final class SchoolListComponent: Component<SchoolListDependency>, SchoolListFactory {
    public func makeView() -> some View {
        SchoolListView(
            viewModel: .init(
                fetchSchoolListUseCase: dependency.fetchSchoolListUseCase
            )
        )
    }
}
