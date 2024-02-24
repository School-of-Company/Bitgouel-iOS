import NeedleFoundation
import SwiftUI
import Service

public protocol EditPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
    var queryPostDetailUseCase: any QueryPostDetailUseCase { get }
}

public final class EditPostComponent: Component<EditPostDependency>, EditPostFactory {
    public func makeView(postID: String) -> some View {
        EditPostView(
            viewModel: .init(
                postID: postID,
                queryPostDetailUseCase: dependency.queryPostDetailUseCase
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
