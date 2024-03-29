import NeedleFoundation
import Service
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var openLectureApplyFactory: any OpenLectureApplyFactory { get }
}

public final class LectureDetailSettingComponent: Component<LectureDetailSettingDependency>, LectureDetailSettingFactory {
    public func makeView() -> some View {
        LectureDetailSettingView(
            viewModel: .init(), openLectureApplyFactory: dependency.openLectureApplyFactory
        )
    }
}
