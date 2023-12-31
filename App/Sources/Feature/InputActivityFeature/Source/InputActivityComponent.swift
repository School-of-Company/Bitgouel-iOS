import NeedleFoundation
import Service

public protocol InputActivityDependency: Dependency {
}

public final class InputActivityComponent: Component<InputActivityDependency>, InputActivityFactory {
    public func makeView() -> some View {
        InputActivityView(
            viewModel: .init(title: .init(), activityText: .init())
        )
    }
}
