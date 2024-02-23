import NeedleFoundation
import SwiftUI

public protocol PostDetailSettingDependency: Dependency {}

public final class PostDetailSettingComponent: Component<PostDetailSettingDependency>, PostDetailSettingFactory {
    public func makeView(
        links: [String],
        completion: @escaping ([String]) -> Void
    ) -> some View {
        PostDetailSettingView(
            viewModel: .init(
                links: links,
                completion: completion
            )
        )
    }
}
