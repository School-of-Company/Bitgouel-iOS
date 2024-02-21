import NeedleFoundation
import Service
import SwiftUI

public protocol PostListDependency: Dependency {}

public final class PostListComponent: Component<PostListDependency>, PostListFactory {
    public func makeView() -> some View {
        PostListView()
    }
}
