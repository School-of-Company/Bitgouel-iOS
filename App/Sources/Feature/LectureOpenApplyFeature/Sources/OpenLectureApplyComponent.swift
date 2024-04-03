import NeedleFoundation
import Service
import SwiftUI

public protocol OpenLectureApplyDependency: Dependency {
    var openLectureUseCase: any OpenLectureUseCase { get }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory { get }
}

public final class OpenLectureApplyComponent: Component<OpenLectureApplyDependency>, OpenLectureApplyFactory {
    public func makeView() -> some View {
        OpenLectureApplyView(
            viewModel: .init(
                openLectureUseCase: dependency.openLectureUseCase
            ),
            lectureDetailSettingFactory: dependency.lectureDetailSettingFactory
        )
    }
}
