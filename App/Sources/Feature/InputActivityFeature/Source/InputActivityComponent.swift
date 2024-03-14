import NeedleFoundation
import Service
import SwiftUI

public protocol InputActivityDependency: Dependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory { get }
    var inputActivityUseCase: any InputActivityUseCase { get }
}

public final class InputActivityComponent: Component<InputActivityDependency>, InputActivityFactory {
    public func makeView(
        state: String,
        activityID: String
    ) -> some View {
        InputActivityView(
            viewModel: .init(
                state: state,
                activityID: activityID,
                inputActivityUseCase: dependency.inputActivityUseCase
            ),
            activityDetailSettingFactory: dependency.activityDetailSettingFactory
        )
    }
}
