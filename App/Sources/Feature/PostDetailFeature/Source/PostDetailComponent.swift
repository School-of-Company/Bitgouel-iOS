import NeedleFoundation
import Service
import SwiftUI

public protocol PostDetailDependency: Dependency {
    var inputPostFactory: any InputPostFactory { get }
    var fetchPostDetailUseCase: any FetchPostDetailUseCase { get }
    var deletePostUseCase: any DeletePostUseCase { get }
}

public final class PostDetailComponent: Component<PostDetailDependency>, PostDetailFactory {
    public func makeView(
        postID: String
    ) -> some View {
        PostDetailView(
            viewModel: .init(
                postID: postID,
                fetchPostDetailUseCase: dependency.fetchPostDetailUseCase,
                deletePostUseCase: dependency.deletePostUseCase
            ),
            inputPostFactory: dependency.inputPostFactory
        )
    }
}
