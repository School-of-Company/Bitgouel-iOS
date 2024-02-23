import NeedleFoundation
import SwiftUI
import Service

public protocol PostDetailDependency: Dependency {
    var editPostFactory: any EditPostFactory { get }
}

public final class PostDetailComponent: Component<PostDetailDependency>, PostDetailFactory {
    public func makeView(
        postID: String
    ) -> some View {
        PostDetailView(
            viewModel: .init(
                postID: postID
            ),
            editPostFactory: dependency.editPostFactory
        )
    }
}
