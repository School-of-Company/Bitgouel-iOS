import NeedleFoundation
import SwiftUI
import Service

public protocol EditPostDependency: Dependency {
    
}

public final class EditPostComponent: Component<EditPostDependency>, EditPostFactory {
    public func makeView(postID: String) -> some View {
        EditPostView(
            vieWModel: .init(
                postID: postID
            )
        )
    }
}
