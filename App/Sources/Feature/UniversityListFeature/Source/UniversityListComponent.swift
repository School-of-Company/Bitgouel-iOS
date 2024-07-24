import NeedleFoundation
import SwiftUI
import Service

public protocol UniversityListDependency: Dependency {
    var fetchUniversityListUseCase: any FetchUniversityListUseCase { get }
}

public final class UniversityListComponent: Component<UniversityListDependency>, UniversityListFactory {
    public func makeView() -> some View {
        UniversityListView(
            viewModel: .init(
                fetchUniversityListUseCase: dependency.fetchUniversityListUseCase
            )
        )
    }
}
