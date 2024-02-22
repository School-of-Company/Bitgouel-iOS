import NeedleFoundation
import SwiftUI
import Service

public protocol PostDetailDependency: Dependency {
    
}

public final class PostDetailComponent: Component<PostDetailDependency>, PostDetailFactory {
    public func makeView() -> some View {
        PostDetailView()
    }
}
