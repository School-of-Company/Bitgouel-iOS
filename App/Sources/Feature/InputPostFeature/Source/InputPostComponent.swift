import NeedleFoundation
import Service
import SwiftUI

public protocol InputPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
    var writePostUseCase: any WritePostUseCase { get }
    var fetchPostDetailUseCase: any FetchPostDetailUseCase { get }
    var updatePostUseCase: any UpdatePostUseCase { get }
}

public final class InputPostComponent: Component<InputPostDependency>, InputPostFactory {
    public func makeView(
        state: String,
        postID: String
    ) -> some View {
        InputPostView(
            viewModel: .init(
                state: state,
                postID: postID,
                writePostUseCase: dependency.writePostUseCase,
                updatePostUseCase: dependency.updatePostUseCase,
                fetchPostDetailUseCase: dependency.fetchPostDetailUseCase
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
