import NeedleFoundation
import Service
import SwiftUI

public protocol InputActivityDependency: Dependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory { get }
    var fetchActivityDetailUseCase: any FetchActivityDetailUseCase { get }
    var inputActivityUseCase: any InputActivityUseCase { get }
    var modifyActivityUseCase: any ModifyActivityUseCase { get }
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
                fetchActivityDetailUseCase: dependency.fetchActivityDetailUseCase,
                inputActivityUseCase: dependency.inputActivityUseCase,
                modifyActivityUseCase: dependency.modifyActivityUseCase
            ),
            activityDetailSettingFactory: dependency.activityDetailSettingFactory
        )
    }
}
