import NeedleFoundation
import Service
import SwiftUI

public protocol LectureOpenApplyDependency: Dependency {
    var lectureOpenApplyFactory: any LectureOpenApplyFactory { get }
    var lectureOpenUseCase: any LectureOpenUseCase { get }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory { get }
}

public final class LectureOpenApplyComponent: Component<LectureOpenApplyDependency>, LectureOpenApplyFactory {
    public func makeView() -> some View {
        LectureOpenApplyView(
            viewModel: .init(
                lectureOpenUseCase: dependency.lectureOpenUseCase
            ),
            lectureOpenApplyFactory: dependency.lectureOpenApplyFactory,
            lectureDetailSettingFactory: dependency.lectureDetailSettingFactory
        )
    }
}
