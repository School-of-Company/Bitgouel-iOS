import NeedleFoundation
import SwiftUI
import Service

public protocol EditPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
}

public final class EditPostComponent: Component<EditPostDependency>, EditPostFactory {
    public func makeView(postID: String) -> some View {
        EditPostView(
            viewModel: .init(
                postID: postID
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
