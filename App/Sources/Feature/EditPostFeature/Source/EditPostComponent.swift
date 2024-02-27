import NeedleFoundation
import Service
import SwiftUI

public protocol EditPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
    var queryPostDetailUseCase: any QueryPostDetailUseCase { get }
    var updatePostUseCase: any UpdatePostUseCase { get }
}

public final class EditPostComponent: Component<EditPostDependency>, EditPostFactory {
    public func makeView(postID: String) -> some View {
        EditPostView(
            viewModel: .init(
                postID: postID,
                updatePostUseCase: dependency.updatePostUseCase,
                queryPostDetailUseCase: dependency.queryPostDetailUseCase
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
