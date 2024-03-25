import NeedleFoundation
import SwiftUI
import Service

public protocol MainDependency: Dependency {
    var fetchFAQListUseCase: any FetchFAQListUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
}

public final class MainComponent: Component<MainDependency>, MainFactory {
    public func makeView() -> some View {
        MainView(
            viewModel: .init(
                fetchFAQListUseCase: dependency.fetchFAQListUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase
            )
        )
    }
}
