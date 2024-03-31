import NeedleFoundation
import Service
import SwiftUI

public protocol PostDetailDependency: Dependency {
    var inputPostFactory: any InputPostFactory { get }
    var queryPostDetailUseCase: any QueryPostDetailUseCase { get }
    var deletePostUseCase: any DeletePostUseCase { get }
}

public final class PostDetailComponent: Component<PostDetailDependency>, PostDetailFactory {
    public func makeView(
        postID: String
    ) -> some View {
        PostDetailView(
            viewModel: .init(
                postID: postID,
                queryPostDetailUseCase: dependency.queryPostDetailUseCase,
                deletePostUseCase: dependency.deletePostUseCase
            ),
            inputPostFactory: dependency.inputPostFactory
        )
    }
}
