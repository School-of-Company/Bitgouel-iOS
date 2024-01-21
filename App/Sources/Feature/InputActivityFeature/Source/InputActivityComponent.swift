import NeedleFoundation
import Service
import SwiftUI

public protocol InputActivityDependency: Dependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory { get }
    var addStudentActivityUseCase: any AddStudentActivityUseCase { get }
}

public final class InputActivityComponent: Component<InputActivityDependency>, InputActivityFactory {
    public func makeView() -> some View {
        InputActivityView(
            viewModel: .init(
                addStudentActivityUseCase: dependency.addStudentActivityUseCase
            ),
            activityDetailSettingFactory: dependency.activityDetailSettingFactory
        )
    }
}
