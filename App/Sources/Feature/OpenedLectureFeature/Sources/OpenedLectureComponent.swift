import NeedleFoundation
import Service
import SwiftUI

public protocol OpenedLectureDependency: Dependency {
    var openLectureUseCase: any OpenLectureUseCase { get }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory { get }
}

public final class OpenedLectureComponent: Component<OpenedLectureDependency>, OpenedLectureFactory {
    public func makeView() -> some View {
        OpenedLectureView(
            viewModel: .init(
                openLectureUseCase: dependency.openLectureUseCase
            ),
            lectureDetailSettingFactory: dependency.lectureDetailSettingFactory
        )
    }
}
