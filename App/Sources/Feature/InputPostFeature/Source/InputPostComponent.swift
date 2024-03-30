import NeedleFoundation
import Service
import SwiftUI

public protocol InputPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
    var writePostUseCase: any WritePostUseCase { get }
    var queryPostDetailUseCase: any QueryPostDetailUseCase { get }
    var updatePostUseCase: any UpdatePostUseCase { get }
}

public final class InputPostComponent: Component<InputPostDependency>, InputPostFactory {
    public func makeView(postID: String) -> some View {
        InputPostView(
            viewModel: .init(
                postID: postID,
                writePostUseCase: dependency.writePostUseCase
                updatePostUseCase: dependency.updatePostUseCase,
                queryPostDetailUseCase: dependency.queryPostDetailUseCase
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
