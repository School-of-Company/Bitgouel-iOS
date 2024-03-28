import NeedleFoundation
import Service
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var lectureOpenApplyFactory: any LectureOpenApplyFactory { get }
}

public final class LectureDetailSettingComponent: Component<LectureDetailSettingDependency>, LectureDetailSettingFactory {
    public func makeView() -> some View {
        LectureDetailSettingView(
            viewModel: .init(), lectureOpenApplyFactory: dependency.lectureOpenApplyFactory
        )
    }
}
