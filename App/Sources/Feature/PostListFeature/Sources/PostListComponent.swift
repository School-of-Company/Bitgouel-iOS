import NeedleFoundation
import Service
import SwiftUI

public protocol PostListDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryPostListUseCase: any QueryPostListUseCase { get }
}

public final class PostListComponent: Component<PostListDependency>, PostListFactory {
    public func makeView() -> some View {
        PostListView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryPostListUseCase: dependency.queryPostListUseCase
            )
        )
    }
}
