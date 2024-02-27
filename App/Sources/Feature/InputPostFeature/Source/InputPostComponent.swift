import NeedleFoundation
import Service
import SwiftUI

public protocol InputPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
    var writePostUseCase: any WritePostUseCase { get }
}

public final class InputPostComponent: Component<InputPostDependency>, InputPostFactory {
    public func makeView() -> some View {
        InputPostView(
            viewModel: .init(
                writePostUseCase: dependency.writePostUseCase
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
