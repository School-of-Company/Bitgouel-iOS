import NeedleFoundation
import SwiftUI

public protocol PostDetailSettingDependency: Dependency {}

public final class PostDetailSettingComponent: Component<PostDetailSettingDependency>, PostDetailSettingFactory {
    public func makeView() -> some View {
        PostDetailSettingView(viewModel: .init())
    }
}
