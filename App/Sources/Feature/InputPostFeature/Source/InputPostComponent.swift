import NeedleFoundation
import SwiftUI
import Service

public protocol InputPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
}

public final class InputPostComponent: Component<InputPostDependency>, InputPostFactory {
    public func makeView() -> some View {
        InputPostView(postDetailSettingFactory: dependency.postDetailSettingFactory)
    }
}
